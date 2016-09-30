package example;
import example.github.service.GithubParser;
import hex.annotation.ClassAnnotationDataProvider;
import hex.collection.HashMap;
import hex.collection.IHashMap;
import hex.compiler.parser.xml.XmlCompiler;
import hex.event.Dispatcher;
import hex.event.MessageType;
import hex.state.control.StateController;
import hex.util.MacroUtil;

/**
 * ...
 * @author Christoph Otter
 */
class RepoExample
{
	
	public static function main () : Void
	{
		new RepoExample ();
	}

	public function new ()
	{
		XmlCompiler.readXmlFile ("example/configuration/context.xml", null, [
			"github" => false, "bitbucket" => true
		]);
	}
	
}