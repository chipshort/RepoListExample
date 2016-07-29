package example;
import example.github.service.GithubParser;
import hex.compiler.parser.xml.XmlCompiler;

/**
 * ...
 * @author Christoph Otter
 */
class GithubExample
{
	
	public static function main () : Void
	{
		new GithubExample ();
	}

	public function new ()
	{
		XmlCompiler.readXmlFile ("example/configuration/context.xml");
	}
	
}