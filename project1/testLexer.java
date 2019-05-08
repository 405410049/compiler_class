import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;


public class testLexer {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		  try {
	           CharStream input = new ANTLRFileStream(args[0]);
	           myLexer lexer = new myLexer(input);
	           Token token = lexer.nextToken();
	           while (token.getType() != -1) {  // -1 is EOF.
	             System.out.println("Token: "+token.getType() + " " + token.getText());
	             token = lexer.nextToken();
	           }
	        } catch(Throwable t) {
	           System.out.println("Exception: "+t);
	           t.printStackTrace();
	        }
	}

}
