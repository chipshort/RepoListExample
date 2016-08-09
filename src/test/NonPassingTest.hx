package test;
import hex.unittest.assertion.Assert;

/**
 * ...
 * @author Christoph Otter
 */
class NonPassingTest
{
	@Test( "" )
	public function testOnViewHelperManagerCreationProperty() : Void
	{
		var message = "This test is used to test the unit test plugin";
		Assert.isInstanceOf( message, Int, "Failed on purpose" );
	}
}
