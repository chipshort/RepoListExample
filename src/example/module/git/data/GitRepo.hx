package example.module.git.data;

/**
 * ...
 * @author Christoph Otter
 */
class GitRepo
{
	public var url : String;
	public var name : String;

	public function new (url : String, name : String)
	{
		this.url = url;
		trace (name);
		this.name = name;
	}
	
}