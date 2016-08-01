package example.module.git.command;
import example.module.git.model.IGitModel;
import example.module.git.service.IGitService;
import hex.control.Request;
import hex.control.command.BasicCommand;
import hex.di.IInjectorContainer;
import hex.service.stateless.IAsyncStatelessService;
import hex.service.stateless.IAsyncStatelessServiceListener;

/**
 * ...
 * @author Christoph Otter
 */
class LoadRepoCommand extends BasicCommand implements IAsyncStatelessServiceListener implements IInjectorContainer
{
	@Inject var gitService : IGitService;
	@Inject var gitModel : IGitModel;
	
	public function new ()
	{
		super ();
	}
	
	public function execute (?request : Request):Void 
	{
		gitService.addListener (this);
		gitService.call ();
	}
	
	public function onServiceComplete (service : IAsyncStatelessService) : Void
	{
		gitModel.setRepos (gitService.getRepos ());
	}
	
	public function onServiceFail (service : IAsyncStatelessService) : Void
	{
		#if debug
		getLogger ().debug (service + " failed");
		#end
	}
	
	public function onServiceCancel (service : IAsyncStatelessService) : Void
	{
		
	}
	
	public function onServiceTimeout (service : IAsyncStatelessService) : Void
	{
		
	}
	
}