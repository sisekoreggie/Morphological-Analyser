
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
import java.awt.Image;
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

public class speller implements ActionListener {
	/* Initialising variables, buttons and the JFrame window */	
	JFrame window = new JFrame();
	JMenuBar menuBar;
	JMenu fileMenu, editMenu, helpMenu;
	JMenuItem newItem, openItem, saveItem, help, about, copy, paste;
	
	JTextArea userInput = new JTextArea(10, 20);
	JScrollPane scrollpane = new JScrollPane(userInput);

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
	
	Icon icon = new ImageIcon(getClass().getResource("uct_logo.jpg")); 
	JLabel logo = new JLabel(icon);
	
	boolean highlightSet = false; //Used to clear text area
	Highlighter highlighter;
	HighlightPainter painter = new DefaultHighlighter.DefaultHighlightPainter(Color.PINK);
	ArrayList<String> all = new ArrayList<>();
	    
	ImageIcon newIcon = new ImageIcon("uct_logo.jpg");
	JPanel pane = new JPanel();
	
	public speller() {
		initComponent();
	}

	private void initComponent() {
		JPanel panel = new JPanel();
		GroupLayout layout = new GroupLayout(panel);
		window.setSize(800, 600);	
		window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		panel.setLayout(layout);
		layout.setAutoCreateGaps(true);
		layout.setAutoCreateContainerGaps(true);
		
        	instruction.setFont(new java.awt.Font("Calibri", 0, 18)); // NOI18N
        	instruction.setForeground(new java.awt.Color(0, 0, 255));
       		instruction.setDoubleBuffered(true);
		
		window.setTitle("                                             IsiXhosa Spelling Checker");
		//window.setResizable(false); 	//window unable to resize
		Image logoStart = newIcon.getImage();
		window.setIconImage(logoStart);
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
		
		editMenu.add(copy);
		editMenu.add(paste);
		
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
	    
		pane.setBorder(BorderFactory.createEtchedBorder());
		userInput.setLineWrap(true);
		userInput.setWrapStyleWord(true);
		clearAll.addActionListener(this);
		ignoreOnce.addActionListener(this);
		ignoreAll.addActionListener(this);
		checkOnce.addActionListener(this);
		checkText.addActionListener(this);
		
	    
	    	layout.setHorizontalGroup(
	    		   layout.createSequentialGroup()
	    		      .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
	    		    		  .addComponent(instruction)
	    		    		  .addComponent(scrollpane)
	    	    		      .addGroup(layout.createSequentialGroup()
	    		    		      		.addComponent(language)
	    		    		      		.addComponent(selectLanguage))
	    	    		      )
	    		      .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
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
		        File myFile = new File("C:\\Users\\Siseko\\eclipse-workspace\\SpellChecker\\src\\documentation.txt");
		        Desktop.getDesktop().open(myFile);
		    } catch (Exception ex) {
		    	JOptionPane.showMessageDialog(null, ex+"");
		    }
		}
	}
	
	/* Find the following word */
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
                    System.out.println(word);
                    if ((word.equals("umntwna") || word.equals("uyfunda") || word.equals("wnza"))) {//incorrect word
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
                        if ((word=="umntwna" || word=="uyfunda" || word.equals("wnza"))) {
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
		
		else if (e.getSource() == about) {
			JOptionPane.showMessageDialog(window, "Hello User\n\n"
					+ "This interface was developed for testing purposes of \n"
					+ "the isiXhosa rule-based error detector.\n\n"
					+ "Developed at the University of Cape Town as an\n"
					+ "Honoours project under the supervision of Dr Maria Keet\n\n"
					+ "Interface from the isiZulu spellchecker by Norman Pilusa\n\n"
					+ "Developed by Siseko Neti\n\n");
		}
	}

	public static void main(String[] args)  {
		//MessageDigest md = MessageDigest.getInstance("SHA");
		speller frames = new speller();
	}

}
