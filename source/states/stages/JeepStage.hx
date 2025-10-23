package states.stages;

import states.stages.objects.*;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.FlxCamera;
import objects.Character;
import states.PlayState;

class JeepStage extends BaseStage
{
	var sunset:FlxSprite;
	var badsunset:FlxSprite;
	var road:FlxSprite;
	var tree:FlxSprite;
	var jeepskipper:FlxSprite;
	var jeepskipperBetter:FlxSprite;
	var kowalski:FlxSprite;
	var privateP:FlxSprite;
	var rico:FlxSprite;
	var jeep:FlxSprite;
	var jeepBetter:FlxSprite;
	var driver:FlxSprite;

	var crazy:Bool = false;

	override public function create():Void
	{
		super.create();

		// Background layers
		sunset = new FlxSprite(-300, -100).loadGraphic(Paths.image("sun"));
		sunset.scrollFactor.set(0, 0);
		add(sunset);

		badsunset = new FlxSprite(-300, -100).loadGraphic(Paths.image("badsun"));
		badsunset.scrollFactor.set(0, 0);
		add(badsunset);
		badsunset.visible = false;

		road = new FlxSprite(-1660, 620);
		road.frames = Paths.getSparrowAtlas("Road");
		road.animation.addByPrefix("idle", "Road", 24, true);
		road.animation.play("idle");
		road.scrollFactor.set(0, 0);
		add(road);

		tree = new FlxSprite(-1900, -300).loadGraphic(Paths.image("Tree"));
		tree.scrollFactor.set(1, 0);
		add(tree);

		jeepskipper = new FlxSprite(-1000, 680);
		jeepskipper.frames = Paths.getSparrowAtlas("Shitty_Jeep");
		jeepskipper.animation.addByPrefix("idle", "Shitty Jeep", 24, true);
		jeepskipper.animation.play("idle");
		add(jeepskipper);

		jeepskipperBetter = new FlxSprite(-1000, 680);
		jeepskipperBetter.frames = Paths.getSparrowAtlas("Better_Jeep");
		jeepskipperBetter.animation.addByPrefix("idle", "Truck", 24, true);
		jeepskipperBetter.animation.play("idle");
		add(jeepskipperBetter);
		jeepskipperBetter.visible = false;

		kowalski = new FlxSprite(-300, 760).loadGraphic(Paths.image("Kowalski"));
		add(kowalski);

		privateP = new FlxSprite(-400, 760).loadGraphic(Paths.image("Private"));
		add(privateP);

		rico = new FlxSprite(-700, 760).loadGraphic(Paths.image("Rico"));
		add(rico);

		jeep = new FlxSprite(200, 800);
		jeep.frames = Paths.getSparrowAtlas("Shitty_Jeep");
		jeep.animation.addByPrefix("idle", "Shitty Jeep", 24, true);
		jeep.animation.play("idle");
		add(jeep);

		jeepBetter = new FlxSprite(200, 800);
		jeepBetter.frames = Paths.getSparrowAtlas("Better_Jeep_BF");
		jeepBetter.animation.addByPrefix("idle", "Truck Low Quality", 24, true);
		jeepBetter.animation.play("idle");
		add(jeepBetter);
		jeepBetter.visible = false;

		driver = new FlxSprite(500, 850).loadGraphic(Paths.image("Demon_Driver"));
		add(driver);
	}

    public function onBeatHit():Void
	{
		super.onBeatHit();

		if (curBeat % 12 == 0)
		{
			tree.x = -1900;
			FlxTween.tween(tree, { x: 1900 }, 0.3, { ease: FlxEase.linear });
		}

		if (crazy)
			FlxTween.tween(FlxG.camera, { zoom: 1.7 }, 0.01, { ease: FlxEase.quadInOut });

		if (curBeat == 144 || curBeat == 464)
			FlxTween.tween(FlxG.camera, { zoom: 1.4 }, 3, { ease: FlxEase.quadInOut });

		if (curBeat == 160 || curBeat == 480)
		{
			crazy = true;
			badsunset.visible = true;
			jeepBetter.visible = true;
			jeepskipperBetter.visible = true;
			jeep.visible = false;
			jeepskipper.visible = false;
			rico.visible = false;
			kowalski.visible = false;
			privateP.visible = false;
			driver.visible = false;
		}

		if (curBeat == 288 || curBeat == 608)
		{
			crazy = false;
			badsunset.visible = false;
			FlxG.camera.zoom = 0.9;
			jeepBetter.visible = false;
			jeepskipperBetter.visible = false;
			jeep.visible = true;
			jeepskipper.visible = true;
			rico.visible = true;
			kowalski.visible = true;
			privateP.visible = true;
			driver.visible = true;
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (crazy)
			FlxG.camera.zoom = 1.2;
	}
}
