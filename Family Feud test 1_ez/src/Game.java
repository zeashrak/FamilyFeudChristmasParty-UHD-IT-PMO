
//import javax.swing.JFrame;
//import java.awt.*;
import javax.swing.JOptionPane;

public class Game
{
    //JFrame window;
    public static void main(String[] args)
    {
        String word = JOptionPane.showInputDialog("Enter first word");

        JOptionPane.showMessageDialog(null, "You entered " + word, "Game", JOptionPane.PLAIN_MESSAGE); //where to position it (null puts it in the middle of the screen),
                                         //what msg to display,
                                         //title bar
                                         //message that will pop up
        //new Game();
    }
}
   // public Game()
 //   {
        //window = new JFrame();
      //  window.setSize(800, 800);
       // window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); //so that it exits when the red x is clicked
       // window.getContentPane().setBackground(Color.black);
     //   window.setLayout(null); //this means we just disabled the default layout
       // window.setVisible(true); //for the window to appear
 //   }
//}

