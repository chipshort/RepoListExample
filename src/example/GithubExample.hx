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
		#if debug
		
		var proxy = new hex.log.layout.LogProxyLayout();
		#if js
		var controller = new hex.log.layout.LogLayoutHTMLView( proxy );
		proxy.addListener( new hex.log.layout.SimpleBrowserLayout( controller.consoleWrapperTaget ) );
		proxy.addListener( new hex.log.layout.JavaScriptConsoleLayout() );
		#elseif flash
		proxy.addListener( new hex.log.layout.TraceLayout() );
		#elseif sys
		proxy.addListener (new hex.log.layout.TraceLayout ());
		#end
		
		#end
		
		new GithubExample ();
	}

	public function new ()
	{
		XmlCompiler.readXmlFile ("example/configuration/context.xml");
	}
	
}