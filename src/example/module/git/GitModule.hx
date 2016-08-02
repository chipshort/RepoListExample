package example.module.git;

import example.module.git.command.LoadRepoCommand;
import example.module.git.message.GitModuleMessage;
import example.module.git.model.GitModel;
import example.module.git.model.IGitModel;
import example.module.git.service.IGitService;
import example.module.git.view.GitViewHelper;
import example.module.git.view.IGitView;
import hex.config.stateful.IStatefulConfig;
import hex.config.stateless.IStatelessConfig;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import hex.view.viewhelper.IViewHelper;
import hex.view.viewhelper.IViewHelperTypedef;

/**
 * ...
 * @author Christoph Otter
 */
class GitModule extends Module
{
	public function new (config : IStatefulConfig) 
	{
		super ();
		
		this._addStatefulConfigs ([config]);
		this._addStatelessConfigClasses ([GitModelConfig, GitCommandConfig]);
		
		buildView ();
	}
	
	override function _onInitialisation () : Void 
	{
	}
	
	override function _getRuntimeDependencies () : IRuntimeDependencies 
	{
		var dep = new RuntimeDependencies ();
		dep.addMappedDependencies ([IGitService]);
		
		return dep;
	}
	
	function buildView () : Void
	{
		var viewHelper : GitViewHelper;
		
		#if js
		var container = js.Browser.document.querySelector (".list");
		viewHelper = this.buildViewHelper (GitViewHelper, new example.module.git.view.GitViewJS (container)); //<--- //CHANGED internally
		#elseif flash
		var container = new flash.display.Sprite ();
		viewHelper = this.buildViewHelper (GitViewHelper, new example.module.git.view.GitViewFlash (container));
		flash.Lib.current.addChild (container);
		#elseif (cpp || neko || cs || java)
		viewHelper = this.buildViewHelper (GitViewHelper, new example.module.git.view.GitViewCmd ());
		#end
		
		this._annotationProvider.registerMetaData ("gitUser", viewHelper, viewHelper.getUser);
	}
	
}

class GitModelConfig extends StatelessModelConfig
{
	override public function configure () : Void 
	{
		this.mapModel (IGitModel, GitModel);
	}
}

class GitCommandConfig extends StatelessCommandConfig
{
	override public function configure () : Void 
	{
		this.map (GitModuleMessage.LOAD_REPOS, LoadRepoCommand);
	}
}