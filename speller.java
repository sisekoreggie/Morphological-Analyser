import java.io.*;
import java.util.*;
import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.LayoutStyle;
import javax.swing.border.TitledBorder;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.text.BadLocationException;
import javax.swing.text.DefaultHighlighter;
import javax.swing.text.Highlighter;
import javax.swing.text.Highlighter.HighlightPainter;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSeparator;
import javax.swing.JTextArea;
import javax.swing.BorderFactory;
import javax.swing.GroupLayout;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Desktop;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.swing.text.DefaultEditorKit;

public class speller implements ActionListener {	
	//private static final long serialVersionUID = 1L;
	//JTextArea window;
	JFrame window = new JFrame();
	JMenuBar menuBar;
	JMenu fileMenu, editMenu, helpMenu;
	JMenuItem newItem, openItem, saveItem, help, about, copy, paste, cut;
	
	JTextArea userInput = new JTextArea(10, 20);
	JScrollPane scrollpane = new JScrollPane(userInput);
	//	JScrollPane scrollpane = new JScrollPane(userInput, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS, JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);


	JLabel instruction = new JLabel("Type, upload a file or paste text in the text area below");
	String lang = "isiXhosa";
	JLabel language = new JLabel("Spellchecking Language: ");
	JLabel selectLanguage = new JLabel(lang);
	JButton checkText = new JButton("Show All");
	JButton ignoreOnce = new JButton("Ignore Once");
	JButton ignoreAll = new JButton("Ignore All");
	JButton clearAll = new JButton("Clear Text");
	JButton checkOnce = new JButton("Show Next");
	JLabel blank = new JLabel();
	FileWriter fileWriter; 


	String currWord = " ";
	int sentNo = 0;
	int wordNo = 0;
	int pos = 0;
	Icon icon = new ImageIcon(getClass().getResource("uct_logo.jpg")); 
	JLabel logo = new JLabel(icon);
	
	boolean highlightSet = false; //Used to clear text area
	Highlighter highlighter;
	HighlightPainter painter = new DefaultHighlighter.DefaultHighlightPainter(Color.PINK);
	ArrayList<String> all = new ArrayList<>();
	    
	    
	JPanel pane = new JPanel();
	
	public speller() {
		initComponent();
	}

	private void initComponent() {
		//userInput.setPreferredSize(new Dimension(450, 110));
		
		JPanel panel = new JPanel();
		GroupLayout layout = new GroupLayout(panel);
		window.setSize(800, 600);	
		window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		panel.setLayout(layout);
		layout.setAutoCreateGaps(true);
		layout.setAutoCreateContainerGaps(true);

		//checkText.addActionListener(this); //Action when the button is clicked
		
        instruction.setFont(new java.awt.Font("Calibri", 0, 18)); // NOI18N
        instruction.setForeground(new java.awt.Color(0, 0, 255));
        //instruction.setText("To begin: Type or paste text below or Click File->Open File... to load a file");
        instruction.setDoubleBuffered(true);
		
		window.setTitle("                                             IsiXhosa Spelling Checker");

		//window.setLocation(new java.awt.Point(200, 50));
		//window.setMinimumSize(new java.awt.Dimension(700, 580));
		
		
		/* Menu Bar */
		menuBar = new JMenuBar();
		
		fileMenu = new JMenu("File");
		editMenu = new JMenu("Edit");
		helpMenu = new JMenu("Help");
		
		newItem = new JMenuItem("New");
		openItem = new JMenuItem("Open");
		saveItem = new JMenuItem("Save");
		
		fileMenu.add(newItem);
		newItem.addActionListener(this);
		fileMenu.add(openItem);
		openItem.addActionListener(this);
		fileMenu.add(saveItem);
		saveItem.addActionListener(this);
		
		
		copy = new JMenuItem("Copy");
		paste = new JMenuItem("Paste");
		cut = new JMenuItem("Cut");
		
		editMenu.add(cut);
		cut.addActionListener(this);
		editMenu.add(copy);
		copy.addActionListener(this);
		editMenu.add(paste);
		paste.addActionListener(this);
        	copy.addActionListener(new DefaultEditorKit.CopyAction());
		paste.addActionListener(new DefaultEditorKit.PasteAction());
		cut.addActionListener(new DefaultEditorKit.CutAction());
		
		about = new JMenuItem("About");
		help = new JMenuItem("Help");
		
		helpMenu.add(help);
		help.addActionListener(this);
		helpMenu.add(about);
		about.addActionListener(this);
		
		menuBar.add(fileMenu);
		menuBar.add(editMenu);
		menuBar.add(helpMenu);
		
		window.setJMenuBar(menuBar);
		
		//selectLanguage.setSelectedIndex(4);
		//selectLanguage.addActionListener(this);
		
		//selectLanguage.setSelectedIndex(4);
		//selectLanguage.setPreferredSize(new Dimension(140,40));
	    
		pane.setBorder(BorderFactory.createEtchedBorder());
		userInput.setLineWrap(true);
		userInput.setWrapStyleWord(true);
		clearAll.addActionListener(this);
		ignoreOnce.addActionListener(this);
		ignoreAll.addActionListener(this);
		checkOnce.addActionListener(this);
		checkText.addActionListener(this);
		
		//window.highlight(userInput, "untu");
	    
	    layout.setHorizontalGroup(
	    		   layout.createSequentialGroup()
	    		      .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
	    		    		  .addComponent(instruction)
	    		    		  .addComponent(scrollpane)
	    	    		      .addGroup(layout.createSequentialGroup()
	    		    		      		.addComponent(language)
	    		    		      		.addComponent(selectLanguage))
	    	    		      )
	    		    		  //.addComponent(language))
	    		      .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
	    		    	   //.addComponent(pane, GroupLayout.DEFAULT_SIZE, 200, GroupLayout.DEFAULT_SIZE)
	    		    	   .addComponent(logo, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
	    		    	   .addComponent(checkOnce, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
	    		           .addComponent(blank)
	    		    	   .addComponent(checkText, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
	    		           .addComponent(blank)
	    		           .addComponent(ignoreOnce, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
	    		           .addComponent(blank)
	    		           .addComponent(ignoreAll, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
	    		           .addComponent(blank)
	    		           .addComponent(clearAll, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
	    		);
	    		layout.setVerticalGroup(
	    		   layout.createParallelGroup(GroupLayout.Alignment.CENTER)
	    		      .addGroup(layout.createSequentialGroup()
	    		    		  .addComponent(instruction)
	    		    		  .addComponent(scrollpane)
	    		    		  .addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
	    		    				  .addComponent(language)
	    		    				  .addComponent(selectLanguage))
	    		    		  )
	    		      .addGroup(layout.createSequentialGroup()
	    		    		//.addComponent(pane, GroupLayout.DEFAULT_SIZE, 200, GroupLayout.DEFAULT_SIZE)
	    		      		.addComponent(logo)
	    		      		.addComponent(checkOnce)
	    		      		.addComponent(blank)
	    		    		.addComponent(checkText)
	    		      		.addComponent(blank)
	    		      		.addComponent(ignoreOnce)
	    		      		.addComponent(blank)
	    		      		.addComponent(ignoreAll)
	    		      		.addComponent(blank)
	    		      		.addComponent(clearAll))
	    		);
	    		
	    //window.add(scrollpane, BorderLayout.CENTER);
		window.add(panel);
		window.pack();
		window.setVisible(true);
	}
	
	/* Loading the contents of a file into a text area */
	public void openItemButton() {
		JFileChooser select = new JFileChooser();
		select.showOpenDialog(null);
		File f = select.getSelectedFile();
		String fileName = f.getAbsolutePath();
	
		try {
			FileReader reader = new FileReader(fileName);
			BufferedReader bfr = new BufferedReader(reader);
			userInput.read(bfr, null);
			bfr.close();
			userInput.requestFocus();
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, openItem+"");
		}
	}
	
	/* Saving the contents of the text area into a textfile */
	public void saveItemButton() {		
	    String text = userInput.getText();
	    JFileChooser chooser = new JFileChooser();
	    int retrival = chooser.showSaveDialog(null);
	    if (retrival == JFileChooser.APPROVE_OPTION) {
	        try {
	            FileWriter fw = new FileWriter(chooser.getSelectedFile()+".txt");
	            fw.write(text.toString());
	            fw.close();
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
	}
	
	/* Clearing the text area */
	public void newItemButton() { 
		userInput.setText(null);
	}
	
	/* Opening a file */
	public void documentationButton() {
		if (Desktop.isDesktopSupported()) {
		    try {
		        File myFile = new File("documentation.txt");
		        Desktop.getDesktop().open(myFile);
		    } catch (Exception ex) {
		    	JOptionPane.showMessageDialog(null, ex+"");
		    }
		}
	}
	
	/* Find the following words */
    private void findWords() {      
        String text = userInput.getText();
        highlighter = userInput.getHighlighter();
        try {
            String[] sentences = text.split("\n");
            String[] words;
            int start;
            int end;
            int position = 0;
            int sentence = 0;

            //Input is just a sentence or word
            if (sentences.length < 2) {
                words = text.split(" ");

                //iterate through words
                for (String word : words) {
                    if (!isCorrect(word)) {	//incorrect word
                        start = text.indexOf(word, position);
                        end = start + word.length();
                        highlighter.addHighlight(start, end, painter);
                    }
                    position += word.length() + 1;
                }
                //Input is a two or more lines
            } else {
                while (sentence < sentences.length) {
                    words = sentences[sentence].split(" ");
                    //iterate through words
                    for (String word : words) {
                        if (!isCorrect(word)) {
                            start = text.indexOf(word, position);
                            end = start + word.length();
                            highlighter.addHighlight(start, end, painter);
                        }
                        position += word.length() + 1;
                    }
                    sentence++;
                }

            }
        } catch (Exception x) {
        	JOptionPane.showMessageDialog(null, x+" ............");
        }
        highlightSet = true;
    }
	/* Method to read one word and tell whether it is correctly spelled or not */

	public boolean isCorrect(String word) {
		boolean value = false;
	     try {
		//Cleaning the previous input file
		PrintWriter pw = new PrintWriter("input.txt");
		pw.close();

		File fout = new File("input.txt");
		FileOutputStream fos = new FileOutputStream(fout);
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(fos));
	 
		//for (int i = 0; i < 1; i++) {
			word = (word.replaceAll("[,.()%?!'-:;/|*#~+=]", " ")).toLowerCase();
			bw.write(word);
			//bw.newLine();
		//}
		bw.close();

		Process p = Runtime.getRuntime().exec("fst-infl intergrated_system.a input.txt output.txt");  //Change this line to the appropriate file that you wanna use for your testing
		p.waitFor(); 

		FileInputStream fstream = new FileInputStream("output.txt");
		BufferedReader br = new BufferedReader(new InputStreamReader(fstream));
			
		String strLine, prevStr = "";
		while ((strLine = br.readLine()) != null)   {
			//System.out.println("In while");
			if (!(strLine.contains("no result for")||(strLine.contains(">")))) 				{    value = true;
			}
			prevStr = strLine.replaceAll("[> ]", "");
		}
		
		br.close();

	    } catch (Exception x) {
		JOptionPane.showMessageDialog(null, x+" speller");
	    }
		return value;
		
	}

	/* Ignore once action performed */
	public void ignoreOnceAction() {
        	String text = userInput.getText();
        	highlighter = userInput.getHighlighter();
		highlighter.removeAllHighlights();
            	String[] sentences = text.split("\n");
		try {
            		String[] words;
            		int start = 0;
            		int end = 0;
            		boolean active = true;
			    //Input is just a sentence or word
			    if (sentences.length < 2) {
				words = text.split(" ");

				//iterate through words
				for (int i = wordNo; i< words.length; i++) {
				    String word = words[i];
				    if (!isCorrect(word)) {	//incorrect word
				        start = text.indexOf(word, pos);
				        end = start + word.length();
				        highlighter.addHighlight(start, end, painter);
					currWord = text.substring(start, end);
					pos += word.length();
					wordNo +=1;
					break;
				    }
				    wordNo+=1;
				    pos += word.length() + 1;
				}
				//Input is a two or more lines
			    } else {
				while (sentNo < sentences.length && active) {
				    words = sentences[sentNo].split(" ");
				    //iterate through words
				    for (int i = wordNo; i< words.length; i++) {
					String word = words[i];
				        if (!isCorrect(word)) {
				            start = text.indexOf(word, pos);
				            end = start + word.length();
				            highlighter.addHighlight(start, end, painter);
						currWord = text.substring(start, end);
						pos += word.length();
						wordNo +=1;
						active = false;
						break;
				   	 }
				   	 wordNo+=1;
				   	 pos += word.length() + 1;
				     }

				     if (wordNo >= words.length) {
					wordNo = 0;
					sentNo++;
				     }
				}

			    }

		} catch (Exception x) {
			JOptionPane.showMessageDialog(null, x+" speller");
	    	}
		highlightSet = true;
	}


	/* Ignore all action performed */
	public void ignoreAllAction() {
        	String text = userInput.getText();
        	highlighter = userInput.getHighlighter();
		highlighter.removeAllHighlights();
		highlightSet = true;
	}

	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == openItem) {
			this.openItemButton();
		}
		else if (e.getSource() == saveItem) {
			this.saveItemButton();
		}
		else if ((e.getSource() == newItem) || (e.getSource() == clearAll)) {
			this.newItemButton();
		}
		else if (e.getSource() == help) {
			this.documentationButton();
		}
		else if (e.getSource() == checkText ) {
			this.findWords();
			//this.findWord();
		}
		else if (e.getSource() == checkOnce) {
			this.ignoreOnceAction();
		}
		else if (e.getSource() == ignoreOnce) {
			this.ignoreOnceAction();
		}
		else if (e.getSource() == ignoreAll) {
			this.ignoreAllAction();
		}
		else if (e.getSource() == about) {
			JOptionPane.showMessageDialog(window, "Hello User\n\n"
					+ "This interface was developed for testing purposes of \n"
					+ "the isiXhosa rule-based error detector.\n\n"
					+ "Developed at the University of Cape Town as an\n"
					+ "Honoours project under the supervision of Dr Maria Keet\n\n"
					+ "Developed by Siseko Neti\n\n"
					+ "\u00a9 Copyright 2017");
		}
	}

	public static void main(String[] args)  {
		//MessageDigest md = MessageDigest.getInstance("SHA");
		speller frames = new speller();
	}

}
