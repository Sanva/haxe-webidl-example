import haxe.ds.Vector;

import SampleModule.IntTuple;
import SampleModule.Point;
import SampleModule.Init as SampleModuleInit;

import hl.types.ArrayBase;

class Sample {

	public static function main() {
		SampleModuleInit.init(startApp);
	}

	public static function startApp() {
		var p1 = new Point();		
		p1.x = 4;
		p1.y = 5;
		var p2 = new Point(7,8);
		var p = p1.op_add(p2);
		trace('Result = ${p.x},${p.y} len=${p.length()}');
		final tuple = new IntTuple(-1, 1);
		trace(tuple.getX());
		trace(tuple.getY());
		p.mutateTuple(tuple.raw);
		trace(tuple.getX());
		trace(tuple.getY());
		tuple.delete();
		p1.delete();
		p2.delete();
		p.delete();
	}
}
