package example.module.git;

import example.module.git.command.LoadRepoCommand;
import example.module.git.message.GitModuleMessage;
import example.module.git.model.GitModel;
import example.module.git.model.IGitModel;
import example.module.git.service.IGitService;
import example.module.git.view.GitViewHelper;
import hex.config.stateful.IStatefulConfig;
import hex.config.stateless.StatelessCommandConfig;
import hex.config.stateless.StatelessModelConfig;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;

/**
 * ...
 * @author Christoph Otter
 */
class GitModule extends Module
{
	public function new (config : IStatefulConfig, userConfig : IStatefulConfig) 
	{
		super ();
		
		this._addStatefulConfigs ([config, userConfig]);
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
		//this._getDependencyInjector ().mapToValue (GitUser, new GitUser ("test"));
		
		#if js
		var container = js.Browser.document.querySelector (".list");
		this.buildViewHelper (GitViewHelper, new example.module.git.view.GitViewJS (container));
		#elseif flash
		var container = new flash.display.Sprite ();
		this.buildViewHelper (GitViewHelper, new example.module.git.view.GitViewFlash (container));
		flash.Lib.current.addChild (container);
		#elseif (cpp || neko || cs || java)
		this.buildViewHelper (GitViewHelper, new example.module.git.view.GitViewCmd ());
		#end
		
		//this._getDependencyInjector ().mapToType (IGitUser, GitUser);
		//this._getDependencyInjector().mapToValue( IUserSettings, new 
		//this._annotationProvider.registerMetaData ("gitUser", viewHelper, viewHelper.getUser);
	}
	
}

class GitModelConfig extends StatelessModelConfig
{
	override public function configure () : Void 
	{
		this.map (IGitModel, GitModel);
	}
}

class GitCommandConfig extends StatelessCommandConfig
{
	override public function configure () : Void 
	{
		this.map (GitModuleMessage.LOAD_REPOS, LoadRepoCommand);
	}
}