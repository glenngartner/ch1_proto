package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Color;
import kha.math.Vector2;
import kha.Font;
import kha.Assets;

class Empty {

	public var font:Font;
	private var initialized = false;

	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);

		Assets.loadEverything(loadingFinished);
	}

	private function loadingFinished(): Void {
		this.initialized = true;

		font = Assets.fonts.Abyss;
	}

	function update(): Void {
		
	}

	function render(framebuffer: Framebuffer): Void {
		if (!this.initialized) return;

		var g = framebuffer.g2;
		g.begin(true, kha.Color.Black);

		g.color = kha.Color.White;
		g.font = font;
		// g.fontSize = cast (Math.floor(framebuffer.width / 25), Int);
		g.fontSize = 36;
		
		var rect1Anchor = new Vector2(0, 0);
		var rect2Anchor = new Vector2(framebuffer.width / 2 * 1.1, 0);

		// left rectangle
		g.fillRect(rect1Anchor.x, rect1Anchor.y, framebuffer.width/2 *.9, framebuffer.height/2);
		// right rectangle
		g.fillRect(rect2Anchor.x, rect2Anchor.y, framebuffer.width/2 * .9, framebuffer.height/2);

		g.color = Color.Black;
		// draw the letters

		g.drawString('Team Name', rect1Anchor.x + 50, rect1Anchor.y + 50);

		g.end();		
	}
}
