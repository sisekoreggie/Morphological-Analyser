
import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.LayoutStyle;
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
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class spell implements ActionListener {	
	//private static final long serialVersionUID = 1L;
	//JTextArea window;
	JFrame window = new JFrame();
	JMenuBar menuBar;
	JMenu fileMenu, editMenu, helpMenu;
	JMenuItem newItem, openItem, saveItem;
	
	JTextArea userInput = new JTextArea(10, 20);
	JScrollPane scrollpane = new JScrollPane(userInput);

	JLabel instruction = new JLabel("Type, upload a file (File -> Open) or paste text in the text area below");
	String[] lang = {"IsiXhosa", "English"};
	JLabel language = new JLabel("Language");
	JComboBox selectLanguage = new JComboBox(lang);
	JButton checkText = new JButton("Check Errors");
	JButton ignoreOnce = new JButton("Ignore Once");
	JButton ignoreAll = new JButton("Ignore All");
	JLabel blank = new JLabel();
	FileWriter fileWriter; 
	

	 JPanel pane = new JPanel();
	
	public spell() {
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
		
		window.setTitle("IsiXhosa Spelling Checker");
		
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
		
		menuBar.add(fileMenu);
		menuBar.add(editMenu);
		menuBar.add(helpMenu);
		
		window.setJMenuBar(menuBar);
		
		//selectLanguage.setSelectedIndex(4);
		//selectLanguage.addActionListener(this);
		pane.setBorder(BorderFactory.createEtchedBorder());
	    
	    layout.setHorizontalGroup(
	    		   layout.createSequentialGroup()
	    		      .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
	    		    		  .addComponent(instruction)
	    		    		  .addComponent(userInput)
	    	    		      .addGroup(layout.createSequentialGroup()
	    		    		      		.addComponent(language)
	    		    		      		.addComponent(selectLanguage))
	    	    		      )
	    		    		  //.addComponent(language))
	    		      .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
	    		    	   //.addComponent(pane, GroupLayout.DEFAULT_SIZE, 200, GroupLayout.DEFAULT_SIZE)
	    		           .addComponent(checkText)
	    		           .addComponent(blank)
	    		           .addComponent(ignoreOnce)
	    		           .addComponent(blank)
	    		           .addComponent(ignoreAll))
	    		);
	    		layout.setVerticalGroup(
	    		   layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
	    		      .addGroup(layout.createSequentialGroup()
	    		    		  .addComponent(instruction)
	    		    		  .addComponent(userInput)
	    		    		  .addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
	    		    				  .addComponent(language)
	    		    				  .addComponent(selectLanguage))
	    		    		  )
	    		      .addGroup(layout.createSequentialGroup()
	    		    		//.addComponent(pane, GroupLayout.DEFAULT_SIZE, 200, GroupLayout.DEFAULT_SIZE)
	    		      		.addComponent(checkText)
	    		      		.addComponent(blank)
	    		      		.addComponent(ignoreOnce)
	    		      		.addComponent(blank)
	    		      		.addComponent(ignoreAll))
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
	
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == openItem) {
			this.openItemButton();
		}
		else if (e.getSource() == saveItem) {
			this.saveItemButton();
		}
		else if (e.getSource() == newItem) {
			this.newItemButton();
		}
	}

	public static void main(String[] args) {
		spell frames = new spell();
	}

}
