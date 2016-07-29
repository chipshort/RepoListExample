package example.github.service;

import example.module.git.data.GitRepo;
import haxe.Json;
import hex.data.ServiceParser;

/**
 * ...
 * @author Christoph Otter
 */
class GithubParser
{
	public function new ()
	{
	}
	
	public function parse (serializedContent : Dynamic) : Dynamic
	{
		var data : Array<Dynamic> = Json.parse (serializedContent);
		var repos = new Array<GitRepo> ();
		
		for (repo in data) {
			repos.push (new GitRepo (repo.html_url, repo.name));
		}
		
		return repos;
	}
	
}