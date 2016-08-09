package;
import hex.service.stateless.IAsyncStatelessService;
import hex.service.stateless.IAsyncStatelessServiceListener;
import hex.service.stateless.http.HTTPService;
import hex.service.stateless.http.HTTPServiceConfiguration;

/**
 * ...
 * @author Christoph Otter
 */
class NekoTest implements IAsyncStatelessServiceListener
{

	public static function main () : Void
	{
		new NekoTest ();
	}
	
	public function new ()
	{
		new Service (this);
	}
	
	public function onServiceComplete( service : IAsyncStatelessService ) : Void
	{
		trace (service.getResult ());
	}
	public function onServiceFail( service : IAsyncStatelessService ) : Void
	{
		trace ("failed");
	}
	public function onServiceCancel( service : IAsyncStatelessService ) : Void
	{
		trace ("canceled");
	}
	public function onServiceTimeout( service : IAsyncStatelessService ) : Void
	{
		trace ("timeout");
	}
	
}

class Service extends HTTPService
{
	public function new (main : NekoTest)
	{
		super ();
		
		setConfiguration (new HTTPServiceConfiguration ("https://api.bitbucket.org/2.0/repositories/b"));
		setParser (this);
		
		addListener (main);
		call ();
	}
	
	
	
	public function parse( serializedContent : Dynamic ) : Dynamic
	{
		return serializedContent;
	}
}