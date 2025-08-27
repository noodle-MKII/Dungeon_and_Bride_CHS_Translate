; 攻撃アニメマクロ集



;========================================================================================
; 各種アニメ

;----------------------------------------------------------------------------------------
; 通常攻撃

*normal_attack
@eval exp='tf.weapon = "weapon"'

*weapon_attacks
@clearemit layer=e3
@jump target=*claw_attack cond='/claw/.test(game.curFighter[tf.weapon])'
@jump target=*punch_attack cond='/punch/.test(game.curFighter[tf.weapon])'
@jump target=*whip_attack cond='/rope/.test(game.curFighter[tf.weapon])'
@jump target=*boomerang_attack cond='/boomerang/.test(game.curFighter[tf.weapon])'
@jump target=*disk_attack cond='/cakram/.test(game.curFighter[tf.weapon])'
@jump target=*beat_attack cond='/beat|rod|tonfa/.test(game.curFighter[tf.weapon])'
@jump target=*heavy_attack cond='/heavy|hammer|sledge/.test(game.curFighter[tf.weapon])'
@jump target=*arrow_attack cond='/bow|longbow/.test(game.curFighter[tf.weapon])'
@jump target=*dagger_attack cond='/dagger|ldagger/.test(game.curFighter[tf.weapon])'
@jump target=*spear_attack cond='/spear|pole/.test(game.curFighter[tf.weapon])'
@jump target=*axe_attack cond='/axe|poleax/.test(game.curFighter[tf.weapon])'
@jump target=*stone_attack cond='/stone|sling/.test(game.curFighter[tf.weapon])'
@jump target=*swing_attack

*second_attack
@eval exp='tf.weapon = "subWeapon"'
@jump target=*weapon_attacks

*counter_attack
@clearemit layer=e3
@playse storage=kira2
@image layer=e3 storage=BE_flash visible=true
@layopt layer=e3 left=&'targetX - 130' top=&'targetTop - 70'
@anime layer=e3
@wa layer=e3
@layopt layer=e3 visible=false
@return

*extra_damage
@eval exp='tf.temp = game.curFighter.getWeaponAttrib()'
@call target=*spread_sparkle cond='tf.temp == "魔"'
@call target=*electric_shock cond='tf.temp == "雷"'
@call target=*burning cond='tf.temp == "火"'
@call target=*freezing cond='tf.temp == "冷"'
@call target=*twinkle_star cond='tf.temp == "聖"'
@call target=*black_steam cond='tf.temp == "邪"'
@call target=*poison_bubble cond='tf.temp == "毒"'
@return

*swing_attack
@anime_attack se=swing2 storage=BE_swing left=-130 top=-150
@wait time=150
@return

*dagger_attack
@anime_attack se=swing2 storage=BE_dagger left=-10 top=-80
@wait time=150
@return

*spear_attack
@anime_attack se=swing2 storage=BE_spear left=-10 top=-80
@wait time=150
@return

*axe_attack
@anime_attack se=swing2 storage=BE_axe left=-10 top=-80
@wait time=150
@return

*claw_attack
@anime_attack se=swing2 storage=BE_claw left=-130 top=-100
@wait time=150
@return

*punch_attack
@image layer=e3 storage=BE_punch
@anime_beat layer=e3 se=beat loop=3
@wait time=100
@return

*beat_attack
@image layer=e3 storage=BE_beat
@anime_beat layer=e3 se=beat loop=1
@wait time=100
@return

*heavy_attack
@image layer=e3 storage=BE_beat
@anime_beat layer=e3 se=hardhit loop=1
@wait time=100
@return

*whip_attack
@image layer=e3 storage=BE_punch
@anime_beat layer=e3 se=whip loop=1
@wait time=100
@return

*arrow_attack
@anime_arrow image=wood se=swing2
@wait time=50
@return

*stone_attack
@anime_missile se=swing2 storage=BE_stone1
@wait time=50
@return

*disk_attack
@eval exp='tf.weaponImage = "disk"'
@anime_missile se=swing3 storage=BE_flying anime=true top=31
@wait time=50
@return

*boomerang_attack
@eval exp='tf.weaponImage = "boomerang"'
@anime_missile se=swing3 storage=BE_flying anime=true
@wait time=50
@return

;----------------------------------------------------------------------------------------
; 特殊効果

*spread_sparkle
@image layer=e3 storage=PE_base_small mode=psdodge5
@layopt layer=e3 left=&'targetX - 110' top=&'targetY - 230' visible=true
@startemit layer=e3 storage=PE_sparkle time=100
@return

*burning
@playse storage=fire2
@image layer=e3 storage=PE_base_flame visible=true
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 330'
@startemit layer=e3 storage=PE_flame_short time=300
@return

*freezing
@playse storage=shakin4
@image layer=e3 storage=PE_base_flame visible=true
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 330'
@startemit layer=e3 storage=PE_freeze time=300
@return

*twinkle_star
@playse storage=kira1
@image layer=e3 storage=PE_base_flame visible=true
@layopt layer=e3 left=&'targetX - 160' top=&'targetY - 230'
@startemit layer=e3 storage=PE_twinkle time=300
@return

*black_steam
@image layer=e3 storage=PE_base_flame visible=true
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 330'
@startemit layer=e3 storage=PE_flame_dshort time=300
@return

*poison_bubble
@playse storage=liquid
@image layer=e3 storage=PE_base_small visible=true mode=psdodge
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 310'
@startemit layer=e3 storage=PE_poison_short time=300
@return

*electric_shock
@playse storage=electric
@image layer=e3 storage=PE_base_small visible=true mode=psdodge
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 180'
@startemit layer=e3 storage=PE_electric_short time=300
@return

*paralysis_shock
@playse storage=electric
@image layer=e3 storage=PE_base_small visible=true mode=psdodge
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 180'
@startemit layer=e3 storage=PE_electric_o1 time=600
@wait time=600
@clearemit layer=e3
@return

*poisonous_liquid
@playse storage=liquid
@image layer=e3 storage=PE_base_small visible=true mode=psdodge
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 310'
@startemit layer=e3 storage=PE_poison_bubble time=1000
@wait time=1000
@clearemit layer=e3
@return

*be_asleep
@playse storage=magic2
@image layer=e3 storage=PE_base_small visible=true mode=psdodge
@layopt layer=e3 left=&'targetX - 150' top=&'targetTop - 50'
@startemit layer=e3 storage=PE_shabon1 time=1600
@wait time=1500
@clearemit layer=e3
@return

*be_drunk
@playse storage=liquid
@image layer=e3 storage=PE_base_small visible=true mode=psdodge
@layopt layer=e3 left=&'targetX - 150' top=&'targetTop - 50'
@startemit layer=e3 storage=PE_shabon2 time=1600
@wait time=1500
@clearemit layer=e3
@return

*be_confused
@wait time=200
@playse storage=confuse
@image layer=e3 storage=PE_base_small visible=true
@layopt layer=e3 left=&'targetX - 150' top=&'targetTop - 100'
@startemit layer=e3 storage=PE_whirl time=600
@wait time=600
@clearemit layer=e3
@return

*charm
@playse storage=poyon
@image layer=e3 storage=screen_pink visible=true
@image layer=e4 storage=PE_base_small visible=true mode=psdodge
@layopt layer=e4 left=&'targetX - 200' top=&'targetY - 250'
@startemit layer=e4 storage=PE_heart_pink1 time=300
@anime_fadein layer=e3
@wait time=500
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*be_stoned
@eval exp='tf.weaponImage = "white"'
@image layer=e3 storage=BE_radiate2 mode=psdodge5 visible=true
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 150'
@playse storage=magic6
@anime layer=e3
@wa layer=e3
@layopt layer=e3 visible=false
@wait time=200
@return

*be_afraid
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=PE_base_flame visible=true
@startemit layer=e4 storage=PE_flame_white time=2000 skip=1000
@playse storage=fire1
@layopt layer=e4 left=&'targetX - 150' top=&'targetY - 250'
@anime_fadein layer=e3,e4
@wait time=500
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

*be_silent
@image layer=e4 storage=PE_base_small mode=psdodge visible=true
@layopt layer=e4 left=&'targetX - 150' top=&'targetY - 200'
@playse storage=magic6loop
@startemit layer=e4 storage=PE_seasonic1 time=500
@wait time=500
@stopse
@anime_fadeout layer=e4
@clearemit layer=e4
@return

*knock_out
@playse storage=smash
@image layer=e5 storage=9999 visible=true left=0 top=0
@quake time=200 hmax=5 vmax=3
@wait time=100
@image layer=e5 storage=BE_rolling_star visible=true clipwidth=46
@layopt layer=e5 left=&'targetX - 40' top=&'targetTop'
@anime layer=e5
@wait time=400
@stopanime layer=e5
@freeimage layer=e5
@return

*killing
@eval exp='game.curTarget.switchFaceState("hurt")' cond='game.curTarget.isUserChara'
@playse storage=slash1 buf=2
@image layer=e3 storage=9999 visible=true
@wait time=50
@layopt layer=e3 visible=false
@image layer=e4 storage=PE_base_small visible=true
@layopt layer=e4 left=&'targetX - 150' top=&'targetY - 200'
@startemit layer=e4 storage=PE_blood time=600
@wait time=600
@clearemit layer=e4
@return

*energy_drain
@playse storage=howling
@image layer=e3 storage=screen_whitefull visible=true opacity=64 top=560
@wait time=40
@layopt layer=e3 opacity=128
@wait time=40
@layopt layer=e3 opacity=192
@image layer=e4 storage=PE_base_large visible=true
@layopt layer=e4 left=&'targetX - 300' top=&'targetY - 250'
@startemit layer=e4 storage=PE_smoke_black time=2000
@wait time=2000
@anime_fadeout layer=e3
@clearemit layer=e4
@return

;----------------------------------------------------------------------------------------
; 特殊コマンド

*charge
@anime_radiate image=yellow se=shuwa1
@return

*hiding
@wait time=500
@playse storage=swing2
@return

*watching
@eval exp='game.curFighter.createFigure(16, game.curFighter.getFigureImageKey("travel"))'
@eval exp='game.cutInFigure(game.curFighter.figureLayer, "alternate", 600)'
@return

*covering
@playse storage=swing2
@eval exp='tf.originalParent = tf.covering.parent'
@eval exp='tf.covering.parent = game.curTarget.parent'
@eval exp='tf.covering.left = game.curTarget.left + (game.curTarget.left < 20 ? 20 : -20)'
@eval exp='tf.covering.top = game.curTarget.top - 20'
@eval exp='tf.covering.lightingLayer.visible = true'
@eval exp='tf.covering.absolute = 2000'
[r][emb exp='tf.covering instanceof "CharaObject" ? tf.covering.name : tf.covering.displayName'] 保护了 [emb exp='game.curTarget instanceof "CharaObject" ? game.curTarget.name : game.curTarget.displayName']！
@wait time=300
@eval exp='tf.covering.lightingLayer.visible = false'
@return

*enemy_escape
@playse storage=swing2
@eval exp='tf.temp = 1 - (random < 0.5) * 2'
@eval exp='game.curFighter.opacity = 192, game.curFighter.left -= 5 * tf.temp'
@wait time=20
@eval exp='game.curFighter.opacity = 128, game.curFighter.left += 20 * tf.temp'
@wait time=20
@eval exp='game.curFighter.opacity = 64, game.curFighter.left += 80 * tf.temp'
@wait time=20
@eval exp='game.curFighter.opacity = 255, game.curFighter.visible = false'
@wait time=200
@return

*_enemy_coming
@return cond='tf.arr.count == 0'
@eval exp='game.curTarget = tf.arr.pop()'
@playse storage=swing2
@eval exp='tf.temp = 1 - (random < 0.5) * 2'
@eval exp='game.curTarget.opacity = 64, game.curTarget.visible = true, game.curTarget.left += 95 * tf.temp'
@wait time=20
@eval exp='game.curTarget.opacity = 128, game.curTarget.left -= 80 * tf.temp'
@wait time=20
@eval exp='game.curTarget.opacity = 192, game.curTarget.left -= 20 * tf.temp'
@wait time=20
@eval exp='game.curTarget.opacity = 255, game.curTarget.left += 5 * tf.temp'
@wait time=30
@wait time=170 cond='! tf.enemyRushing'
@jump target=*_enemy_coming

*enemy_calling
@playse storage=fingerwhistle
@image layer=e3 storage=PE_base_half visible=true
@layopt layer=e3 left=&'targetX - 256' top=&'targetY - game.curTarget.height \ 2 - 320'
@startemit layer=e3 storage=PE_howling time=500
@wait time=100
[if exp='game.curFighter.status.has(o.沈黙)']
	@eval exp='game.curFighter.act.result = -1'
	@clearemit layer=e3
	@stopse
	@wait time=600
	@return
[endif]
@wait time=900
@clearemit layer=e3
@eval exp='tf.arr = game.enemy.callNewMonster(game.curFighter.data, intrandom(1, 2 + (game.turnCount < 5)))'
@eval exp='game.curFighter.act.result = tf.arr.count'
@jump target=*_enemy_coming

*enemy_summoning
@playse storage=magic6loop
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=PE_base_small visible=true mode=psdodge
@anime_fadein layer=e3
@layopt layer=e4 left=&'targetX - 150' top=&'targetY - 180'
@startemit layer=e4 storage=PE_zodiac3 time=1000
@wait time=100
[if exp='game.curFighter.status.has(o.沈黙)']
	@eval exp='game.curFighter.act.result = -1'
	@clearemit layer=e4
	@stopse
	@wait time=600
	@return
[endif]
@wait time=800
@anime_fadeout layer=e3
@clearemit layer=e4
@eval exp='tf.arr = game.enemy.callNewMonster(m[game.curFighter.act.list.draw()], game.curFighter.act.num.draw())'
@eval exp='game.curFighter.act.result = tf.arr.count'
@jump target=*_enemy_coming

*enemy_rushing
; 一斉に敵が集まってくる演出
[iscript]
tf.arr = [];
for(var i = 0; i < game.enemy.reservedMonsters.count; i++)
{
	if(game.enemy.reservedMonsters[i] !== void) tf.arr.add(game.enemy.members[i]);
}
game.enemy.visible = false;
game.enemy.shiftCenter = [0, 0, 0];
game.enemy.putMonsters(game.enemy.getMonstersList());
game.enemy.disappear();
game.enemy.visible = true;
[endscript]
@eval exp='tf.enemyRushing = true'
@call target=*_enemy_coming
@eval exp='tf.enemyRushing = false'
@return

;----------------------------------------------------------------------------------------
; Ｈイベント攻撃

*capture_heroine
[if exp='game.curTarget.status.has(o.拘束)']
	@wait time=200
	@return
[endif]
@eval exp='game.curTarget.cutInFigure(FACE["surprise"].num, "alternate", 600,, "showBust")'
@eval exp='tf.cancelAct = game.curTarget.getCancelAction(game.curFighter, false)'
	; 攻撃がキャンセルされることがあるのでここでも調べる
[if exp='tf.cancelAct === void']
	@playse buf=1 storage=beat
	@eval exp='game.figureLayer.left + 5'
	@wait time=20
	@eval exp='game.figureLayer.left - 5'
	@wait time=20
	@eval exp='game.figureLayer.left + 5'
	@wait time=20
	@eval exp='game.figureLayer.left - 5'
	@wait time=1000
	[if exp='game.getCharaCovering(game.curFighter.act, game.curTarget) !== void']
		;「かばう」が実行された
		@eval exp='game.cutOutFigure("none")'
		@return
	[endif]
	@playse buf=1 storage=dosa
	@eval exp='game.cutOutFigure("none")'
	@quake time=500
[else]
	@playse buf=1 storage=swing2
	@wait time=1000
	@eval exp='game.cutOutFigure("none")'
[endif]
@wait time=200
@return

*capture_event
@eval exp='game.curChara = game.curTarget'
@wait time=500
@btmes off
@eval exp='game.rightClickEnabled = false'
; 今の仕様だと決闘時に捕縛イベントは発生させられない（ ↓ のレイヤーを使用するため）
@layopt layer=0 left=0 top=0 opacity=255 visible=false
@layopt layer=0 page=back left=0 top=0 opacity=255 visible=false
@call storage="capture.scn" target=&'"*" + game.curChara.capturers[0].img + "_" + game.curChara.keyName'
@layopt layer=0 visible=false
@layopt layer=0 page=back visible=false
@eval exp='game.rightClickEnabled = true'
@cancelskip
@cancelautomode
@gameon
@wakuset w=0
@btmes
@return

*tentacle_attack
@eval exp='game.battleInfo.absolute += 100'
@eval exp='game.curTarget.cutInFigure(FACE["fight"].num, "alternate", 600);'
@wait time=600
@playse storage=flying
@image layer=e4 visible=true storage=screen_deepbluefull
@image layer=e5 visible=true left=112 top=200 storage=&'"cutin_" + game.curFighter.data.tentacle'
@wait time=800
[if exp='game.getCharaCovering(game.curFighter.act, game.curTarget) !== void']
	;「かばう」が実行された
	@layopt layer=e4 visible=false
	@layopt layer=e5 visible=false
	@eval exp='game.cutOutFigure("none")'
	@return
[endif]
*_tentacle_covering
@eval exp='tf.temp = game.curTarget.createGropingCutin(game.curFighter.data.tentacle)'
[if exp='game.curTarget.avoidingTrap || tf.temp === void']
	; 装備変更により失敗した
	@layopt layer=e4 visible=false
	@layopt layer=e5 visible=false
	@eval exp='game.cutOutFigure("none")'
	@return
[endif]
@eval exp='kag.effects[5].assignImages(tf.temp)'
@eval exp='kag.effects[5].setSizeToImageSize()'
@layopt layer=e5 visible=true left=212 top=120
@wait time=500
@eval exp='tf.temp = game.curTarget.createGropingCutin(game.curFighter.data.tentacle + 2, false)'
@eval exp='kag.effects[5].beginTransition(%[method: "crossfade", time: 350], tf.temp)'
[if exp='! game.inBattle']
	@wait time=400
	@eval exp='tf.temp = game.curTarget.createGropingCutin(game.curFighter.data.tentacle, false)'
	@eval exp='kag.effects[5].beginTransition(%[method: "crossfade", time: 350], tf.temp)'
	@wait time=400
	@eval exp='tf.temp = game.curTarget.createGropingCutin(game.curFighter.data.tentacle + 2, false)'
	@eval exp='kag.effects[5].beginTransition(%[method: "crossfade", time: 350], tf.temp)'
	@playse storage=kucha
	@wait time=400
	@eval exp='tf.temp = game.curTarget.createGropingCutin(game.curFighter.data.tentacle, false)'
	@eval exp='kag.effects[5].beginTransition(%[method: "crossfade", time: 350], tf.temp)'
[endif]
@playse storage=kucha
@wait time=400
@eval exp='game.battleInfo.absolute -= 100'
@layopt layer=e4 visible=false
@layopt layer=e5 visible=false
@eval exp='game.curTarget.cutInFigure(37, "none", 600)'
@eval exp='game.curTarget.switchFaceState("ecstasy")'
@shake layer=cutin loop=4 length=2
@wait time=400
@eval exp='game.cutOutFigure("alternate")'
@return

;----------------------------------------------------------------------------------------
; 技・特殊攻撃

*assult_attack
@playse storage=swing2
@eval exp='game.figureLayer.absolute += 1000'
[if exp='game.curFighter.status.has(o.潜伏)']
	@eval exp='game.curFighter.createFigure(FACE["fight"].num)'
	@eval exp='game.cutInFigure(game.curFighter.figureLayer, "assult", 250)'
	@wait time=200
	@eval exp='game.cutOutFigure("breakaway", 250)'
[else]
	@eval exp='game.curFighter.createFigure(FACE["surprise"].num)'
	@eval exp='game.cutInFigure(game.curFighter.figureLayer, "assult", 250)'
	@wait time=200
	@playse storage=beat
	@image layer=e4 storage=9999 left=0 top=0 opacity=255 visible=true
	@anime_fadeout layer=e4
	@wait time=500
	@eval exp='game.cutOutFigure("alternate")'
[endif]
@wait time=200
@eval exp='game.figureLayer.absolute -= 1000'
@return

*turn_undead
@playse storage=kira1
@image layer=e0 storage=BE_irradiate1 mode=dodge left=35 top=&'targetBottom - 40'
@layopt layer=e3 left=35 top=&'targetGroupBottom - 560'
@image layer=e3 storage=BE_irradiate2 mode=dodge clipheight=&'560 - kag.effects[3].top'
@image layer=e4 storage=PE_base_view visible=true left=0 top=&'kag.effects[3].top'
@startemit layer=e4 storage=PE_powder4 time=2500 skip=1000
@anime_fadein layer=e0,e3,e4
@eval exp='tf.i = 0, tf.arr = game.curTarget.group, tf.result = true'
@call target=*_turn_undead_loop
@wait time=2000
@eval exp='tf.i = 0, tf.result = false'
@call target=*_turn_undead_loop
@anime_fadeout layer=e0,e3,e4
@clearemit layer=e4
@return
*_turn_undead_loop
@eval exp='tf.arr[tf.i].lightingLayer.visible = tf.result'
@eval exp='tf.i ++'
@jump target=*_turn_undead_loop cond='tf.i < tf.arr.count'
@return

*poison_arrow
@anime_arrow image=poison layer=e3 se=swing2
@call target=*poisonous_liquid
@wait time=50
@return

*fire_arrow
@image layer=e3 storage=screen_deepredfull
@playse storage=fire1
@anime_fadein layer=e3
@image layer=e4 storage=PE_base_pillar visible=true mode=psdodge5
@layopt layer=e4 left=&'targetX - 150' top=&'attackWay * 768'
@startemit layer=e4 storage=&'"PE_firearrow_" + (attackWay == 1 ? "u" : "d")' time=1500 skip=1000
@move layer=e4 path=&'"," + (targetY + 284 * attackWay - 384) + ","' time=500
@wait time=400
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*incinerate_ball
@playse buf=1 storage=magic7
@image layer=e3 storage=screen_bluefull
@image layer=e4 storage=PE_base_small visible=true mode=psdodge5
@layopt layer=e4 left=&'targetX - 150' top=300
@startemit layer=e4 storage=PE_darkball time=-1 skip=2000
@anime_fadein layer=e3,e4
@eval exp='game.curTarget.switchFaceState("hurt")'
*_incinerate_ball_loop
@eval exp='game.curTarget.opacity -= 15'
@eval exp='game.curTarget.top -= 4'
@wait time=200
@jump target=*_incinerate_ball_loop cond='game.curTarget.opacity > 1'
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@wait time=200
[if exp='game.getCharaCovering(game.curFighter.act, game.curTarget) !== void']
	;「かばう」が実行された
	@eval exp='game.curTarget.opacity = 255'
	@eval exp='game.curTarget.resetPos()'
	@return
[endif]
@return

*suck_blood
@playse storage=liquid
@image layer=e3 storage=PE_base_small visible=true mode=psdodge
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 180'
@startemit layer=e3 storage=PE_suckblood time=1600
@wait time=2000
@clearemit layer=e3
@return

*electric_burst
@playse storage=electric
@image layer=e3 storage=PE_base_party mode=psdodge visible=true
@layopt layer=e3 left=-124 top=&'cap(targetGroupY - 190, 216)' cond='attackWay == 1'
@layopt layer=e3 left=&'targetGroupX - 512' top=474 cond='attackWay == -1'
@startemit layer=e3 storage=&'"PE_electric_y" + (attackWay == 1 ? 3 : 2)' time=600
@wait time=600
@clearemit layer=e3
@return

*cold_breeze
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=PE_base_party visible=true
@layopt layer=e4 left=&'targetGroupX - 210' top=&'targetGroupY - 280'
@startemit layer=e4 storage=PE_freeze2 time=1000
@anime_fadein layer=e3
@playse storage=shakin4
@wait time=500
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*venom_mist
@playse storage=acid
@image layer=e3 storage=PE_base_small visible=true
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 200'
@startemit layer=e3 storage=PE_cloud_green time=1000
@wait time=1000
@clearemit layer=e3
@return

*hypnotic_mist
@playse storage=magic2
@image layer=e3 storage=BE_fog
@layopt layer=e3 left=0 top=&'targetGroupY - 300' visible=true opacity=0
@move layer=e3 time=400 path=-160,,255
@wm
@move layer=e3 time=800 path=-480,,255
@wm
@move layer=e3 time=800 path=-640,,0
@wm
@layopt layer=e3 visible=false opacity=255
@wait time=100
@return

*poison_breath
@image layer=e3 storage=screen_blue
@anime_fadein layer=e3
@playse storage=fire1
@image layer=e4 storage=PE_base_view visible=true
@layopt layer=e4 top=0 left=&'game.curFighter.left + game.curFighter.width \ 2 - 512'
@startemit layer=e4 storage=PE_breath_green time=2000
@wait time=2000
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*fire_breath
@image layer=e3 storage=screen_red
@anime_fadein layer=e3
@playse storage=fire1
@image layer=e4 storage=PE_base_party visible=true
@layopt layer=e4 left=0 top=140 cond='attackWay == 1'
@layopt layer=e4 left=&'targetGroupX - 512' top=378 cond='attackWay == -1'
@startemit layer=e4 storage=&'"PE_breath_" + (attackWay == 1 ? "side" : "red")' time=1000
@wait time=1000
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*big_fire_breath
@image layer=e3 storage=screen_red
@anime_fadein layer=e3
@playse storage=fire1
@image layer=e4 storage=PE_base_view top=0 left=0 visible=true
@layopt layer=e4 left=&'game.curFighter.left + game.curFighter.width \ 2 - 512' cond='attackWay == -1'
@startemit layer=e4 storage=&'"PE_breath_" + (attackWay == 1 ? "side_l" : "red_l")' time=2000
@wait time=2000
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*ice_breath
@image layer=e3 storage=screen_blue
@anime_fadein layer=e3
@playse storage=fire1
@image layer=e4 storage=PE_base_view top=0 left=0 visible=true
@layopt layer=e4 left=&'game.curFighter.left + game.curFighter.width \ 2 - 512' cond='attackWay == -1'
@startemit layer=e4 storage=PE_breath_white time=2000
@wait time=2000
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*death_breath
@image layer=e3 storage=screen_deepblackfull
@anime_fadein layer=e3
@playse storage=howling
@image layer=e4 storage=PE_base_full visible=true
@layopt layer=e4 top=0 left=0
@startemit layer=e4 storage=PE_smoke_red1 time=3000
@wait time=3000
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*thunder_storm
@image layer=e3 storage=screen_deepblue
@anime_fadein layer=e3
@image layer=e4 storage=PE_base_view mode=psdodge5
@layopt layer=e4 left=0 top=0 visible=true
@playse storage=thunder2 buf=2
@startemit layer=e4 storage=PE_thunderstorm2 time=800
@wait time=800
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*devide_slash
@image layer=e2 storage=screen_bluefull
@anime_fadein layer=e2
@wait time=100
[if exp='game.curFighter.weapon == "rope"']
	@playse storage=bun
	@image layer=e4 storage=BE_horizenline_r
[else]
	@playse storage=slash3
	@image layer=e4 storage=BE_horizenline_w
	@image layer=e3 storage=PE_base_chara visible=true mode=psdodge
	@layopt layer=e3 left=0 top=&'attackWay == 1 ? targetAverageY - 103 : 560'
	@startemit layer=e3 storage=PE_powder5 time=600
[endif]
@layopt layer=e4 left=800 top=&'attackWay == 1 ? targetAverageY : 663' visible=true
@wait time=20
@layopt layer=e4 left=400
@wait time=20
@layopt layer=e4 left=0
@wait time=500
@anime_fadeout layer=e2,e4
@clearemit layer=e3
@return

;----------------------------------------------------------------------------------------
; 武器投げ
*throw_handax
@eval exp='tf.weaponImage = "handaxe"'
@anime_missile se=swing3 storage=BE_flying anime=true time=40
@wait time=100
@return

*throw_tomahawk
@eval exp='tf.weaponImage = "tomahawk"'
@anime_boomerang se=swing3 storage=BE_flying anime=true time=40
@wait time=100
@return

*throw_javelin
@anime_missile se=swing2 storage=BE_javelin
@wait time=100
@return

;----------------------------------------------------------------------------------------
; 攻撃魔法
*spell_fire
@playse storage=fire1
@image layer=e3 storage=screen_red
@image layer=e4 storage=PE_base_flame visible=true
@layopt layer=e4 left=&'targetX - 150' top=&'targetY - 250'
@startemit layer=e4 storage=PE_flame_red
@anime_fadein layer=e3,e4
@wait time=500
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

*spell_mega_fire
; 読み込み済み
@image layer=e3 storage=screen_blue
@layopt layer=e9 left=&'targetGroupX - 300' top=&'targetAverageY - 120' visible=true
@playse storage=fire1
@anime layer=e9
@anime_fadein layer=e3
@wait time=600
@layopt layer=e9 visible=false
@stopanime layer=e9
@anime_fadeout layer=e3
@return


*spell_giga_fire
; 読み込み済み
@image layer=e3 storage=screen_deepred visible=true
@layopt layer=e8 left=&'targetGroupX - 450' top=&'targetBottom - 500' visible=true
@playse storage=fire1
@anime layer=e8
@anime_fadein layer=e3,e8
@wait time=1800
@anime_fadeout layer=e3,e8
@stopanime layer=e8
@return

*spell_inferno
@eval exp='var startTick = System.getTickCount()'
@eval exp='System.doCompact()'
@image layer=e3 storage=screen_deepred visible=true
@image layer=e4 storage=BE_inferno1 clipwidth=800 clipheight=600 mode=addalpha
@eval exp='dm("アニメーションの開始に " + (System.getTickCount() - startTick) + " ms かかりました")'
@layopt layer=e4 left=&'targetX - 400' top=&'targetBottom - 550' visible=true
@playse storage=fire1
@anime_fadein layer=e3,e4
@wait time=1400
@anime_fadeout layer=e3,e4
@freeimage layer=e4
@return

*spell_hell_fire
; 読み込み済み
@image layer=e1 storage=screen_deepbluefull
@layopt layer=e1 index=-10
@playse storage=fire1
@anime layer=e6
@anime_fadein layer=e1,e6
@wait time=1800
@anime_fadeout layer=e1,e6
@layopt layer=e1 index=-50
@stopanime layer=e6
@return

*spell_thunder
@image layer=e3 storage=screen_bluefull
@anime_fadein layer=e3
@playse storage=thunder1
@image layer=e4 storage=PE_base_pillar
@layopt layer=e4 left=&'targetX - 150' top=0 visible=true mode=psdodge
@startemit layer=e4 storage=PE_thunder time=600
@wait time=600
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*spell_mega_thunder
@image layer=e3 storage=screen_bluefull
@anime_fadein layer=e3
@playse storage=thunder1
@image layer=e4 storage=PE_base_half
@layopt layer=e4 left=&'targetX - 256' top=&'targetY - 500' visible=true
@startemit layer=e4 storage=PE_thunderbolt time=600
@wait time=600
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*spell_giga_thunder
@eval exp='System.doCompact()'
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=BE_thunderstorm clipwidth=480 clipheight=768
@anime_fadein layer=e3
@playse storage=thunder2
@layopt layer=e4 left=&'targetX - 240' top=&'attackWay == 1 ? -120 : 0' visible=true
@anime layer=e4
@wa layer=e4
@anime_fadeout layer=e3
@freeimage layer=e4
@wait time=200
@return

*spell_spark
@image layer=e3 storage=screen_deepblue
@anime_fadein layer=e3
@image layer=e4 storage=PE_base_party mode=psdodge
@layopt layer=e4 left=0 top=&'targetAverageY - 192' visible=true
@eval exp='tf.temp = attackWay == 1 ? "f" : (game.curTarget.group.depth == 0 ? "l" : "r")'
@startemit layer=e4 storage=&'"PE_thunderslash_" + tf.temp' time=600
@playse storage=thunder1
@wait time=1000
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*spell_giga_spark
@image layer=e3 storage=screen_deepblue
@eval exp='System.doCompact()'
@image layer=e4 storage=BE_thunderclap clipwidth=1024 clipheight=512
@anime_fadein layer=e3
@layopt layer=e4 left=0 top=&'attackWay == 1 ? 44 : 428' visible=true
@playse storage=thunder2
@anime layer=e4
@wait time=1000
@anime_fadeout layer=e3,e4
@stopanime layer=e4
@freeimage layer=e4
@wait time=200
@return

*spell_freeze
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=PE_base_flame left=&'targetX - 150' top=&'targetY - 330' visible=true
@startemit layer=e4 storage=PE_freeze time=1000
@anime_fadein layer=e3
@playse storage=shakin4
@wait time=500
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*spell_mega_freeze
@image layer=e3 storage=screen_blue
@image layer=e4 storage=PE_base_full
@eval exp='tf.temp = attackWay == 1 ? "u" : (game.curTarget.group.depth == 0 ? "l" : "r")'
@startemit layer=e4 skip=2000 storage=&'"PE_blizzard_" + tf.temp'
@anime_fadein layer=e3,e4
@layopt layer=e4 visible=true
@playse storage=blizzard1
@wait time=1000
@layopt layer=e3 visible=false
@clearemit layer=e4
@return

*spell_giga_freeze
@image layer=e3 storage=screen_blue
@image layer=e4 storage=PE_base_full left=0 top=0 mode=psdodge
@eval exp='tf.temp = attackWay == 1 ? "u" : (game.curTarget.group.depth == 0 ? "l" : "r")'
@startemit layer=e4 storage=&'"PE_icefall_" + tf.temp'
@anime_fadein layer=e3
@layopt layer=e4 visible=true
@playse storage=icecrash
@wait time=1500
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*spell_mega_venom
@playse storage=acid
@image layer=e3 storage=PE_base_party visible=true
@layopt layer=e3 left=&'targetGroupX - 512' top=&'targetGroupBottom - 360'
@startemit layer=e3 storage=PE_cloud_biggreen time=1500
@wait time=1500
@clearemit layer=e3
@return

*spell_light_ball
@anime_circle image=white se=magic6
@wait time=200
@return

*spell_light_stream
@playse storage=magic6
@image layer=e0 storage=screen_blue
@anime_fadein layer=e0
@image layer=e2 storage=BE_pillar clipwidth=280 clipheight=480 mode=psdodge
@image layer=e3 storage=BE_pillar clipwidth=280 clipheight=480 mode=psdodge
@image layer=e4 storage=BE_pillar clipwidth=280 clipheight=480 mode=psdodge
@layopt layer=e2 visible=true left=&'targetGroupX +  90' top=&'targetBottom - 480'
@layopt layer=e3 visible=true left=&'targetGroupX - 140' top=&'targetBottom - 480'
@layopt layer=e4 visible=true left=&'targetGroupX - 370' top=&'targetBottom - 480'
@wait time=1000
@anime_fadeout layer=e0,e2,e3,e4
@freeimage layer=e2
@freeimage layer=e3
@freeimage layer=e4
@return

*spell_light_fall
@image layer=e2 storage=screen_blue
@image layer=e4 storage=PE_base_view visible=true mode=psdodge
@layopt layer=e4 left=&'attackWay == 1 ? 0 : 62' top=&'targetGroupBottom - 650'
@image layer=9 page=back storage=9999 visible=true left=0 top=0
@anime_fadein layer=e2
@playse storage=beam2
@startemit layer=e4 storage=PE_lightlinefall time=2000
@wait time=500
@playse buf=1 storage=byun2
@trans method=universal rule=rule_45 time=1000
@wt
@wait time=100
@layopt layer=9 visible=false
@layopt layer=9 page=back visible=false
@layopt layer=e2 visible=false
@clearemit layer=e4
@btmes show
@return

*spell_meteor
@image layer=e2 storage=screen_blue
@image layer=e0 storage=BE_meteor left=0 top=-720 visible=true
@image layer=e4 storage=PE_base_full left=0 top=0 visible=true mode=psdodge
@image layer=9 page=back storage=9999 visible=true left=0 top=0
@playse buf=0 storage=fire3
@eval exp='particle_object.start(game.backScreen, 10, "PE_lightstream2.pee")'
@wait time=2000
@playse buf=1 storage=byun2
@btmes off
@eval exp='game.enemy.members[3].top -= 200'
@wait time=50
@eval exp='game.enemy.members[3].top -= 200'
@wait time=50
@eval exp='game.enemy.members[3].top -= 200'
@wait time=50
@eval exp='game.enemy.members[3].top -= 200'
@wait time=1000
@stopse buf=0
@eval exp='particle_object.stopparticle(%[slot: 10])'
@move layer=e0 time=500 path=0,0,255
@wait time=2000
@anime_fadein layer=e2
@playse storage=meteor
@startemit layer=e4 storage=PE_meteor time=3000
@wait time=2000
@playse buf=1 storage=bashan3
@trans method=universal rule=rule_45 time=1000
@wt
@wait time=500
@eval exp='particle_object.start(game.backScreen, 10, "PE_lightstream1.pee")'
@wait time=500
@layopt layer=9 visible=false
@layopt layer=9 page=back visible=false
@layopt layer=e2 visible=false
@layopt layer=e0 visible=false
@clearemit layer=e4
@eval exp='game.enemy.members[3].top += 800'
@btmes show
@return

*spell_stone_bullet
@anime_missile se=swing2 storage=BE_stone2 top=0
@wait time=50
@return

*spell_metal_bullet
@playse storage=swing3
@image layer=e4 storage=9999
@image layer=e3 storage=PE_base_pillar visible=true
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 384'
@startemit layer=e3 storage=&'"PE_metal1_" + (attackWay == 1 ? "u" : "d")' time=200
@wait time=500
@layopt layer=e4 visible=true
@wait time=50
@layopt layer=e4 visible=false
@wait time=50
@clearemit layer=e3
@return

*spell_metal_storm
@playse storage=swing3
@image layer=e4 storage=9999
@image layer=e3 storage=PE_base_full visible=true
@layopt layer=e3 left=&'targetGroupX - 512' top=0
@startemit layer=e3 storage=&'"PE_metal2_" + (attackWay == 1 ? "u" : "d")' time=500
@wait time=500
@layopt layer=e4 visible=true
@wait time=50
@layopt layer=e4 visible=false
@wait time=50
@layopt layer=e4 visible=true
@wait time=50
@layopt layer=e4 visible=false
@wait time=50
@clearemit layer=e3
@return

*spell_earthquake
@playse storage=earthquake
@image layer=e0 storage=BE_earthcrack left=265 top=489 opacity=255
@image layer=5 storage=screen_red left=0 top=0 opacity=255
@quake time=2200 hmax=20 vmax=20
@anime_fadein layer=5
@layopt layer=e0 visible=true
@wait time=2000
@anime_fadeout layer=5
@wait time=200
@wq
@layopt layer=e0 visible=false
@return

*spell_maelstrom
@image layer=e3 storage=screen_bluefull
@image layer=e4 storage=PE_base_full visible=true mode=psdodge5
@startemit layer=e4 storage=PE_maelstrom
@playse storage=maelstrom
@anime_fadein layer=e3
@wait time=3000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

*spell_star_burst
@image layer=e3 storage=screen_blackfull
@image layer=e4 storage=PE_base_full visible=true
@playse storage=lightshower
@startemit layer=e4 storage=PE_star_burst
@anime_fadein layer=e3
@wait time=2500
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

;----------------------------------------------------------------------------------------
; 特殊攻撃魔法

*spell_sleep
@playse storage=liquid
@image layer=e3 storage=PE_base_party visible=true mode=psdodge
@layopt layer=e3 left=&'targetGroupX - 512' top=&'targetTop - 50'
@startemit layer=e3 storage=PE_shabon3 time=1600
@wait time=1500
@clearemit layer=e3
@return

*spell_paralize
@playse storage=electric
@image layer=e3 storage=PE_base_party mode=psdodge visible=true
@layopt layer=e3 left=-124 top=&'targetGroupY - 190' cond='attackWay == 1'
@layopt layer=e3 left=&'targetGroupX - 512' top=&'targetGroupY - 190' cond='attackWay == -1'
@startemit layer=e3 storage=&'"PE_electric_o" + (attackWay == 1 ? 3 : 2)' time=600
@wait time=600
@clearemit layer=e3
@return

*spell_charm
@playse storage=poyon
@image layer=e3 storage=screen_pink visible=true
@image layer=e4 storage=PE_base_view visible=true mode=psdodge
@layopt layer=e4 left=&'targetGroupX - 450' top=&'targetGroupY - 280'
@startemit layer=e4 storage=PE_heart_pink2 time=1200
@anime_fadein layer=e3
@wait time=1200
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*spell_life_drain
@playse storage=liquid
@image layer=e3 storage=PE_base_small visible=true mode=psdodge
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 180'
@startemit layer=e3 storage=PE_sucklife time=1600
@wait time=2000
@clearemit layer=e3
@return

*spell_turn_devil
@playse storage=magic4
@image layer=e3 storage=screen_bluefull
@image layer=e4 storage=PE_base_small visible=true mode=psdodge
@layopt layer=e4 left=&'targetX - 150' top=&'targetY - 180'
@anime_fadein layer=e3
@startemit layer=e4 storage=PE_zodiac2 time=1500
@wait time=1500
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*spell_fear
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=PE_base_large visible=true
@startemit layer=e4 storage=PE_flame_bigw time=2500 skip=1000
@playse storage=fire1
@layopt layer=e4 left=&'targetGroupX - 300' top=&'targetGroupY - 440'
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@wait time=200
@return

*spell_death
@playse storage=fire1
@image layer=e3 storage=screen_blue
@image layer=e4 storage=PE_base_flame visible=true
@layopt layer=e4 left=&'targetX - 150' top=&'targetY - 250'
@startemit layer=e4 storage=PE_flame_black
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

*spell_crash_dead
@image layer=e4 storage=BE_darkcurtain mode=psdodge
@pimage layer=e4 storage=BE_heavenlight2 dx=&'targetX - 250' dy=0 mode=copy
@image layer=e5 storage=PE_base_half visible=true mode=psdodge
@layopt layer=e5 left=&'targetX - 256' top=0
@playse storage=magic4
@startemit layer=e5 storage=PE_powder3 time=5000 skip=2000
@anime_fadein layer=e4
@wait time=1500
@anime_fadeout layer=e4
@clearemit layer=e5
@return

*spell_death_cloud
@playse storage=fire1
@image layer=e3 storage=screen_bluefull
@image layer=e4 storage=PE_base_full visible=true
@eval exp='tf.temp = attackWay == 1 ? "u" : (game.curTarget.group.depth == 0 ? "l" : "r")'
@startemit layer=e4 storage=&'"PE_blow_dark_" + tf.temp' time=3000
@anime_fadein layer=e3
@wait time=2000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

*spell_prism_bolt
@image layer=e3 storage=screen_bluefull
@image layer=e4 storage=PE_base_full mode=psdodge
@startemit layer=e4 storage=PE_prismball time=4000 skip=2000
@layopt layer=e4 left=0 top=&'attackWay == 1 ? -100: 250'
@anime_fadein layer=e3,e4
@playse storage=magic6
@wait time=2000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

;----------------------------------------------------------------------------------------
; 回復魔法

*spell_heal
@image layer=e3 storage=screen_blue
@image layer=e4 storage=PE_base_small visible=true mode=psdodge5
@startemit layer=e4 storage=PE_potion1 time=1500 skip=1000
@playse storage=healing
@layopt layer=e4 left=&'targetX - 150' top=&'targetBottom - 320'
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@wait time=200
@return

*spell_power_heal
@image layer=e3 storage=screen_blue
@image layer=e4 storage=PE_base_small visible=true mode=psdodge5
@startemit layer=e4 storage=PE_potion2 time=1500 skip=1000
@playse storage=healing
@layopt layer=e4 left=&'targetX - 150' top=&'targetBottom - 320'
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@wait time=200
@return

*spell_extra_heal
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=BE_potion3 clipwidth=320 clipheight=440 mode=dodge
@playse storage=healing
@layopt layer=e4 left=&'targetX - 160' top=&'targetBottom - 380'
@anime layer=e4
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@stopanime layer=e4
@freeimage layer=e4
@wait time=200
@return

*spell_recovery
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=BE_potion4 clipwidth=400 clipheight=500 mode=dodge
@playse storage=healing
@layopt layer=e4 left=&'targetX - 200' top=&'targetBottom - 440'
@anime layer=e4
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@stopanime layer=e4
@freeimage layer=e4
@wait time=200
@return

*spell_multi_heal
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=BE_potion5 clipwidth=640 clipheight=430 mode=dodge
@playse storage=healing
@layopt layer=e4 left=&'targetGroupX - 320' top=&'targetGroupY - 220'
@anime layer=e4
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@stopanime layer=e4
@freeimage layer=e4
@wait time=200
@return

*spell_grand_heal
; 読み込み済み
@image layer=e3 storage=screen_bluefull
@playse storage=healing
@layopt layer=e7 left=12 top=400
@anime layer=e7
@anime_fadein layer=e3,e7
@wait time=700
@anime_fadeout layer=e3,e7
@stopanime layer=e7
@wait time=200
@return

*spell_aid
@image layer=e3 storage=screen_blue
@image layer=e4 storage=PE_base_flame visible=true mode=psdodge5
@startemit layer=e4 storage=PE_potion_purple1 time=1500 skip=1000
@playse storage=healing
@layopt layer=e4 left=&'targetX - 150' top=&'targetBottom - 380'
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@wait time=200
@return

*spell_power_aid
@image layer=e3 storage=screen_blue
@image layer=e4 storage=PE_base_flame visible=true mode=psdodge5
@startemit layer=e4 storage=PE_potion_purple2 time=1500 skip=1000
@playse storage=healing
@layopt layer=e4 left=&'targetX - 150' top=&'targetBottom - 460'
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@wait time=200
@return

*spell_multi_aid
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=BE_potion_purple3 clipwidth=640 clipheight=420 mode=dodge
@playse storage=healing
@layopt layer=e4 left=&'targetGroupX - 320' top=&'targetGroupY - 220'
@anime layer=e4
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@stopanime layer=e4
@freeimage layer=e4
@wait time=200
@return

*spell_cure_mind
@playse storage=healing
@image layer=e3 storage=screen_blue
@image layer=e4 storage=PE_base_flame mode=psdodge5
@startemit layer=e4 storage=PE_smoke_purple time=1500 skip=1000
@layopt layer=e4 left=&'targetX - 150' top=&'targetBottom - 480'
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@wait time=200
@return

*spell_cure_paralysis
@playse storage=healing
@image layer=e3 storage=screen_blue
@image layer=e4 storage=PE_base_flame mode=psdodge5
@startemit layer=e4 storage=PE_smoke_yellow time=1500 skip=1000
@layopt layer=e4 left=&'targetX - 150' top=&'targetBottom - 480'
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@wait time=200
@return

*spell_cure_poison
@playse storage=healing
@image layer=e3 storage=screen_blue
@image layer=e4 storage=PE_base_flame mode=psdodge5
@startemit layer=e4 storage=PE_smoke_green time=1500 skip=1000
@layopt layer=e4 left=&'targetX - 150' top=&'targetBottom - 480'
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@wait time=200
@return

*spell_refresh
@playse storage=healing
@image layer=e3 storage=screen_blue
@image layer=e4 storage=PE_base_flame mode=psdodge5
@startemit layer=e4 storage=PE_smoke_blue time=1500 skip=1000
@layopt layer=e4 left=&'targetX - 150' top=&'targetBottom - 480'
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@wait time=200
@return

*spell_grand_cure
@playse storage=healing
@image layer=e3 storage=screen_blue
@image layer=e4 storage=BE_smoke_bigblue clipwidth=980 clipheight=270 mode=psdodge5
@layopt layer=e4 left=22 top=498
@anime layer=e4
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@stopanime layer=e4
@freeimage layer=e4
@wait time=200
@return

*spell_raise_dead
[if exp='(game.curTarget.isUserChara && game.curTarget.slot >= 3) || game.curTarget.isHiring']
	@eval exp='game.curFighter.cutInFigure(FACE["fight"].num, "reverse", 0,, "cast")'
[else]
	@eval exp='game.curFighter.cutInFigure(FACE["fight"].num, "alternate", 464,, "cast")'
[endif]
@image layer=e3 storage=BE_darkcurtain
@pimage layer=e3 storage=BE_greenlife dx=&'targetX - 250' dy=0 mode=copy
@image layer=e4 storage=PE_base_half visible=true mode=psdodge
@layopt layer=e4 left=&'targetX - 256' top=0
@playse storage=kira1
@anime_fadein layer=e3
@startemit layer=e4 storage=PE_green_leaf time=2700 skip=1000
@wait time=2000
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*spell_resurrection
[if exp='(game.curTarget.isUserChara && game.curTarget.slot >= 3) || game.curTarget.isHiring']
	@eval exp='game.curFighter.cutInFigure(FACE["fight"].num, "reverse", 0,, "cast")'
[else]
	@eval exp='game.curFighter.cutInFigure(FACE["fight"].num, "alternate", 464,, "cast")'
[endif]
@image layer=e3 storage=BE_darkcurtain
@pimage layer=e3 storage=BE_heavenlight1 dx=&'targetX - 250' dy=0 mode=copy
@image layer=e4 storage=PE_base_half visible=true mode=psdodge
@layopt layer=e4 left=&'targetX - 256' top=0
@playse storage=kira1
@startemit layer=e4 storage=PE_powder2 time=5000 skip=2000
@anime_fadein layer=e3
@wait time=2000
@anime_fadeout layer=e3
@clearemit layer=e4
@return

;----------------------------------------------------------------------------------------
; 補助魔法

*spell_bless
@playse storage=kira1
@image layer=e3 storage=screen_bluefull
@image layer=e4 storage=PE_base_party left=0 top=384 mode=psdodge5 cond='attackWay == -1'
@image layer=e4 storage=PE_base_view left=0 top=0 mode=psdodge5 cond='attackWay == 1'
@startemit layer=e4 storage=PE_stardust_w time=1500
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

*spell_mirror_wall
@image layer=e4 storage=BE_glassboard clipwidth=200 clipheight=256
@layopt layer=e4 left=&'targetX - 100' top=&'targetY - 128'
@playse storage=magic2
@anime_fadein layer=e4
@wait time=1000
@anime layer=e4
@playse storage=kira2 buf=2
@wait time=500
@blink layer=e4 time=20 loop=3
@return

*spell_protection
@eval exp='tf.weaponImage = "cyan"'
@image layer=e4 storage=BE_barrier
@layopt layer=e4 left=0 top=408
@playse storage=magic2
@anime_fadein layer=e4
@wait time=1000
@anime layer=e4
@playse storage=kira2 buf=2
@wait time=500
@blink layer=e4 time=20 loop=3
@return

*spell_missle_shield
@eval exp='tf.weaponImage = "yellow"'
@image layer=e4 storage=BE_barrier
@layopt layer=e4 left=0 top=408
@playse storage=magic2
@anime_fadein layer=e4
@wait time=1000
@anime layer=e4
@playse storage=kira2 buf=2
@wait time=500
@blink layer=e4 time=20 loop=3
@return

*spell_silence
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=PE_base_full mode=psdodge visible=true
@layopt layer=e4 left=&'targetGroupX - 512' top=&'targetGroupY - 384'
@playse storage=magic6loop
@anime_fadein layer=e3
@startemit layer=e4 storage=PE_seasonic2 time=1500
@wait time=1500
@stopse
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

*erase_magic
@se f=shuwa2
@image layer=9 page=back storage=9999 visible=true left=0 top=0
@trans method=universal rule=rule_48 time=300
@wt
@layopt layer=9 page=back visible=false
@trans method=universal rule=rule_48 time=300
@wt
@wait time=200
@btmes show
@return

*spell_slow
@playse storage=healing
@image layer=e2 storage=screen_blue
@image layer=e3 storage=PE_base_large mode=psdodge5
@image layer=e4 storage=PE_clock
@startemit layer=e3 storage=PE_powder1 time=2700 skip=1000
@layopt layer=e3 left=&'targetGroupX - 300' top=&'targetGroupBottom - 600'
@layopt layer=e4 left=&'targetGroupX - 150' top=&'targetGroupBottom - 500'
@anime_fadein layer=e2,e3,e4
@wait time=1500
@anime_fadeout layer=e2,e3,e4
@wait time=200
@clearemit layer=e3
@return

*spell_regenerate
@anime_radiate image=cyan se=magic4
@return

*spell_guard
@anime_radiate image=green se=magic4
@return

*spell_magic_weapon
@anime_radiate image=orange se=magic5
@return

*spell_barrier
@anime_radiate image=pink se=magic6 wide=true
@return

*spell_power_guard
@anime_radiate image=green se=magic4 wide=true
@return

*spell_speedup
@image layer=e3 storage=screen_bluefull
@image layer=e4 storage=&'"PE_base_" + (attackWay == 1 ? "view" : "chara")' mode=psdodge
@layopt layer=e4 left=0 top=&'attackWay == 1 ? 0 : 560'
@startemit layer=e4 storage=PE_stream_blue time=1400
@wait time=200
@playse storage=magic1
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

*spell_accelerate
@image layer=e3 storage=screen_bluefull
[if exp='game.curTarget.parent == game.enemy']
	@image layer=e4 storage="PE_base_full" mode=psdodge
	@layopt layer=e4 left=&'targetX - 512' top=&'cap(targetY - 384, 0)'
[elsif exp='game.curTarget.parent == game.party']
	@image layer=e4 storage="PE_base_chara" mode=psdodge
	@layopt layer=e4 left=&'targetX - 512' top=560
[else]
	@image layer=e4 storage="PE_base_guest" mode=psdodge
	@layopt layer=e4 left=&'targetX - 66' top=&'targetTop - 2'
[endif]
@startemit layer=e4 storage=PE_stream_yellow time=1400
@wait time=200
@playse storage=magic1
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

;----------------------------------------------------------------------------------------
; 探索用魔法

*spell_malor
@eval exp='game.curFighter.cutInFigureOnBattle()'
@wait time=500
@playse storage=byun2
@image layer=7 storage=9999 left=0 top=0 page=back visible=true
@trans method=universal time=300 rule=rule_01
@wt
[if exp='! tf.byTreasureTrap && ! game.inBattle && game.map != game.autoMap.curMap']
	@eval exp='game.map = game.autoMap.curMap'
	@eval exp='game.map.open()'
[endif]
@eval exp='game.updateView()'
@eval exp='game.enemy.disappear()' cond='game.inBattle'
@eval exp='game.cutOutFigure("alternate")'
@wt
@layopt layer=7 page=back visible=false
@trans method=universal time=300 rule=rule_01
@wt
@return

*spell_loktofeit
@eval exp='game.curFighter.cutInFigureOnBattle()'
@wait time=500
@playse storage=byun2
@image layer=7 storage=9999 left=0 top=0 page=back visible=true
@trans method=universal time=300 rule=rule_48
@wt
@eval exp='game.cutOutFigure("alternate")'
@wt
@image layer=7 page=back storage=0000
@trans method=universal time=300 rule=rule_48
@wt
@btmes show
[r]返回最后造访的城镇
@wait time=1000
@layopt layer=7 visible=false
@layopt layer=7 page=back visible=false
@btmes off
@eval exp='game.closeBattle()' cond='game.inBattle'
@eval exp='game.map.getFloorInfo().pimg = void' cond='game.map.getFloorInfo().pimg == "bridge"'
@eval exp='game.enterTown(game.townView.curTown, game.townView.curSpot)'
@wait time=1000
@return storage="battle.ks" target=*skip_process

*spell_jump
[if exp='game.party.isWaterWalking()']
	[r]可是，因为坐在船上，所以无法跳跃！
	@playse buf=2 storage=buzzer
	@notice text="y在船只移动时无法跳跃！"
	@btmes off
	@return
[endif]
@playse buf=2 storage=period
@wait time=500
@eval exp='game.walk("jumpForward")'
@return

*spell_levitate
@playse storage=acid
@image layer=e3 storage=PE_base_party visible=true left=0 top=384
@startemit layer=e3 storage=PE_blow_upper time=800
@wait time=700
@eval exp='game.view.top += 10'
@wait time=20
@eval exp='game.view.top += 10'
@wait time=20
@eval exp='game.view.top += 10'
@wait time=20
@eval exp='game.view.top += 10'
@anime_fadeout layer=e3
@clearemit layer=e3
[if exp='! o.浮遊.cond(game.party)']
	@wait time=1000
	@playse storage=erase
	@eval exp='game.view.top -= 20'
	@wait time=20
	@eval exp='game.view.top -= 20'
	@wait time=500
[endif]
@return

*spell_boat
@eval exp='game.curFighter.cutInFigureOnBattle()'
@wait time=1000
@eval exp='game.curFighter.act.result = game.party.setBoat()'
@eval exp='game.cutOutFigure("alternate")'
@wait time=1000 cond='game.curFighter.act.result == "ボートを浮かべようとしたら水に流された！"'
@return cond='game.curFighter.act.result !== void'
@playse buf=2 storage=period
@eval exp='game.party.moveByForce(game.party.curFront)'
@btmes
@return

*spell_calnova
[if exp='game.curFighter.act.checkUnlock()']
	@playse storage=kacha
	@anime_number layer=e3 left=350 top=400 text="UNLOCK" color=0xFFFFC0
[else]
	@anime_number layer=e3 left=350 top=400 text="MISS"
[endif]
@return

;----------------------------------------------------------------------------------------
; その他の魔法

*calling
@image layer=e3 storage=screen_blue
@image layer=e4 storage=BE_zodiac1 clipwidth=300 clipheight=180 mode=psdodge
@image layer=e5 storage=&'game.curFighter.act.img' visible=true opacity=0 mcolor=0xFFFFFF mopacity=255
@layopt layer=e5 left=&'900 - kag.effects[5].width >> 1' top=&'540 - kag.effects[5].height'
@anime_fadein layer=e3
@playse storage=magic6loop
@layopt layer=e4 left=300 top=400 visible=true
@anime layer=e4
@clickskip enabled=true
@move layer=e5 time=2000 path=,,255
@wm
@fadeoutse time=500
@anime_fadeout layer=e4
@stopanime layer=e4
@freeimage layer=e4
@image layer=e4 storage=&'game.curFighter.act.img' visible=true
@layopt layer=e4 left=&'kag.effects[5].left' top=&'kag.effects[5].top'
@eval exp='game.cutOutFigure("alternate")'
@wait time=500
@anime_fadeout layer=e5
@wait time=500
@anime_fadeout layer=e3,e4
@cancelskip
@clickskip enabled=false
@return

*summoning_song
@eval exp='game.curFighter.createFigure(FACE["sing"].num)'
@eval exp='game.cutInFigure(game.curFighter.figureLayer, "alternate", 600)'
*summoning_card
@eval exp='game.curFighter.act = game.getBestSummoningMonster()'
@call target=*calling
@return

*scout_monster
@playse buf=2 storage=up1
@wait time=1000
@eval exp='game.cutOutFigure("alternate")'
@wait time=500
@btmes off
@playse buf=2 storage=period
@eval exp='game.curTarget.setLifeBar()'
@eval exp='game.itemWin.openEnemyStatus(game.curTarget)'
@eval exp='game.setPrev(game.notice.processScenario)'
@eval exp='game.setPrev()'
@waitinput name="noticeClick"
@eval exp='game.itemWin.close()'
@wait time=500
@eval exp='game.curFighter.useResource()'
@return storage="battle.ks" target=*next_chara

*spell_escape
@playse storage=acid
@image layer=e3 storage=screen_whitefull opacity=0 visible=true
@image layer=e4 storage=PE_base_full left=0 top=0 visible=true
@startemit layer=e4 storage=PE_smoke_large time=2500
@move layer=e3 time=2000 path=,,255
@wait time=2000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

*devine_intervention
@playse storage=kira1
@image layer=e4 storage=BE_shushine visible=false
@image layer=e5 storage=PE_base_full mode=psdodge
@startemit layer=e5 storage=PE_linespread1 skip=2000
@anime_fadein layer=e4,e5
@wait time=2000
@anime_fadeout layer=e4,e5
@clearemit layer=e5
@return

*spell_mahaman
@eval exp='game.curFighter.cutInFigureOnBattle()'
@call target=*devine_intervention
@btmes off
@wait time=500
@eval exp='game.cutOutFigure("alternate")'
@eval exp='tf.i = 0'
@command type=long title="您要引发什么奇迹？"
*_spell_mahaman_loop
@select text=&'game.curFighter.act.choice[tf.i].order' exp=&'"tf.num = " + tf.i'
@eval exp='tf.i ++'
@jump target=*_spell_mahaman_loop cond='tf.i < game.curFighter.act.choice.count'
@playse buf=2 storage=period
[ask]
@eval exp='game.curFighter.act.result = tf.num'
[if exp='game.curFighter.act.choice[tf.num].type == 0']
	@eval exp='game.curFighter.target = game.party.allMembers'
[elsif exp='game.curFighter.act.choice[tf.num].type == 1']
	@eval exp='game.curFighter.target = game.party.members'
[else]
	@eval exp='game.curFighter.target = game.enemy.members'
[endif]
@eval exp='game.curTarget = game.curFighter.getTarget()'
@return

*spell_iharon
@eval exp='game.curFighter.cutInFigureOnBattle()'
@call target=*devine_intervention
@btmes off
@wait time=500
@eval exp='game.cutOutFigure("alternate")'
@playse buf=2 storage=period
*_spell_iharon_restart
@eval exp='tf.i = 0'
@command type=long title="您有什么愿望？" cancel=true
*_spell_iharon_loop
@select text=&'game.curFighter.act.choice[tf.i].order' exp=&'"tf.num = " + tf.i'
@eval exp='tf.i ++'
@jump target=*_spell_iharon_loop cond='tf.i < game.curFighter.act.choice.count'
[ask]
@eval exp='game.curFighter.act.result = tf.num'
@eval exp='game.noReturnMenu = true'
[if exp='game.curFighter.act.choice[tf.num].range == 1']
	@waitchoosechara text="请选择对象"
	@jump target=*_spell_iharon_restart cond='game.curTarget === void'
[elsif exp='game.curFighter.act.choice[tf.num].range != -1']
	@eval exp='game.curFighter.target = game.party.members'
	@eval exp='game.curTarget = game.curFighter.getTarget()'
[endif]
@btmes show
@return

;----------------------------------------------------------------------------------------
; 楽器

*music_fire_cracker
@playse storage=samba
@image layer=e3 storage=screen_blue
@anime_fadein layer=e3
@image layer=e4 storage=PE_base_view mode=psdodge
@layopt layer=e4 left=0 top=&'targetGroupBottom - 400' visible=true
@startemit layer=e4 storage=PE_firecracker time=700
@wait time=800
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*music_diamonddust
@playse storage=sleighbells
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=PE_base_view left=0 top=0 visible=true mode=psdodge5
@startemit layer=e4 storage=PE_diamonddust time=3000 skip=2000
@anime_fadein layer=e3
@wait time=1000
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*music_holy_chimes
@playse storage=chime
@image layer=e3 storage=BE_irradiate4
@image layer=e4 storage=BE_irradiate3 mode=dodge left=0 top=0 visible=true
@image layer=e5 storage=PE_base_view left=0 top=0 visible=true mode=psdodge5
@startemit layer=e5 storage=PE_powder7 time=3000 skip=2000
@anime_fadein layer=e3,e4,e5
@wait time=1000
@anime_fadeout layer=e3,e4,e5
@clearemit layer=e5
@return

*music_thunder_storm
@playse storage=drum1
@image layer=e3 storage=screen_deepblue
@anime_fadein layer=e3
@image layer=e4 storage=PE_base_view mode=psdodge5
@layopt layer=e4 left=0 top=0 visible=true
@wait time=600
@playse storage=thunder2 buf=2
@startemit layer=e4 storage=PE_thunderstorm1 time=400
@wait time=600
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*music_earthquake
@playse storage=drum2
@image layer=5 storage=screen_red left=0 top=0 opacity=255
@image layer=e4 storage=PE_base_view left=0 top=0 visible=true mode=psdodge5
@startemit layer=e4 storage=PE_earthdust time=2000
@quake time=1800 hmax=10 vmax=10
@anime_fadein layer=5
@wait time=1600
@anime_fadeout layer=5
@clearemit layer=e4
@wait time=200
@wq
@return

*music_gong
@playse storage=gong
@image layer=e3 storage=PE_base_large left=350 top=0 visible=true
@startemit layer=e3 storage=PE_soundwave time=500
@wait time=1500
@clearemit layer=e3
@return

*music_encourage
@wait time=200
@playse storage=tambourine
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=PE_base_full mode=psdodge5
@layopt layer=e4 left=200 top=0 visible=true
@startemit layer=e4 storage=PE_star_pop1 time=100
@anime_fadein layer=e3
@wait time=800
@anime_fadeout layer=e3
@clearemit layer=e4
@anime_radiate image=yellow se=shuwa1
@return

*music_sleep
@playse storage=harp01
@image layer=e3 storage=BE_fog
@layopt layer=e3 left=0 top=&'targetGroupY - 300' visible=true opacity=0
@move layer=e3 time=400 path=-160,,255
@wm
@move layer=e3 time=800 path=-480,,255
@wm
@move layer=e3 time=800 path=-640,,0
@wm
@layopt layer=e3 visible=false opacity=255
@wait time=100
@return

*music_insanity
@playse storage=harp02
@image layer=e3 storage=screen_deepblackfull
@image layer=e4 storage=PE_base_full mode=psdodge5 visible=true
@startemit layer=e4 storage=PE_star_pop2 time=1500
@anime_fadein layer=e3
@wait time=1500
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*music_healing
@playse storage=harp03
@image layer=e3 storage=screen_bluefull
@image layer=e4 storage=PE_base_party left=0 top=404 mode=psdodge5
@startemit layer=e4 storage=PE_stardust_b time=1500
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

*music_angel
@playse storage=harp04
@image layer=e3 storage=screen_bluefull
@image layer=e4 storage=PE_base_party left=0 top=404 mode=psdodge5
@startemit layer=e4 storage=PE_stardust_p time=1500 delay=500
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

;----------------------------------------------------------------------------------------
; 罠

*bomber_trap
@playse storage=bomber
@image layer=e3 storage=PE_base_party visible=true mode=psdodge
@layopt layer=e3 left=0 top=480
@startemit layer=e3 storage=PE_bomber1 time=200
@wait time=600
@clearemit layer=e3
@return

*poison_needle
@anime_missile se=needle storage=BE_needle top=-50
@wait time=50
@return

*poison_gas
@playse storage=acid
@image layer=e3 storage=PE_base_party visible=true
@layopt layer=e3 left=0 top=480
@startemit layer=e3 storage=PE_blow_green time=2000
@wait time=2000
@anime_fadeout layer=e3
@clearemit layer=e3
@return

*suck_magic
@playse storage=liquid
@image layer=e3 storage=PE_base_small visible=true mode=psdodge
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 180'
@startemit layer=e3 storage=PE_suckmagic time=1600
@wait time=2000
@clearemit layer=e3
@return

*spirits_swarm
@playse storage=howling
@image layer=e3 storage=screen_white visible=true opacity=64
@wait time=40
@layopt layer=e3 opacity=128
@wait time=40
@layopt layer=e3 opacity=192
@image layer=e4 storage=PE_base_party visible=true
@layopt layer=e4 left=0 top=384
@startemit layer=e4 storage=PE_wisp_hopping time=2000
@wait time=2000
@anime_fadeout layer=e3
@clearemit layer=e4
@return

*drug_mist
@playse storage=scratch
@image layer=e3 storage=screen_deepbluefull
@image layer=e4 storage=PE_base_full visible=true
@layopt layer=e4 left=0 top=0
@startemit layer=e4 storage=PE_smoke_pink time=3000 skip=1000
@anime_fadein layer=e3,e4
@wait time=2000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

*medusa_eye
@anime_circle image=white se=magic6
@wait time=200
@return

*incinerate_lay
@anime_circle image=black se=magic6
@wait time=200
@return

*gravity_trap
@playse storage=magic7
@image layer=e3 storage=screen_deepbluefull
@image layer=e4 storage=PE_base_full visible=true
@startemit layer=e4 storage=PE_stream_purple time=3000 skip=1000
@anime_fadein layer=e3,e4
@wait time=2000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

*smoke_trap
@playse storage=acid
@layopt layer=e1 left=0 top=0 opacity=255 visible=false index=-65
@layopt layer=e2 left=0 top=0 opacity=255 visible=false index=-64
@image layer=e1 storage=darkzone_smoke opacity=0 visible=true clipwidth=900 clipheight=600 top=-40
@image layer=e2 storage=PE_base_view left=0 top=0 visible=true
@startemit layer=e2 storage=PE_smoke_gray time=2500
@move layer=e1 time=2000 path=,,255
@wait time=2000
@eval exp='o.煙.onSetStatus()'
@anime_fadeout layer=e1,e2
@clearemit layer=e2
@layopt layer=e1 left=0 top=0 opacity=255 visible=false index=-50
@layopt layer=e2 left=0 top=0 opacity=255 visible=false index=-1
@return

*hypnotic_gas
@playse storage=acid
@image layer=e3 storage=PE_base_view left=0 top=0 visible=true
@startemit layer=e3 storage=PE_smoke_double time=2500
@wait time=2000
@clearemit layer=e3
@return

*acid_spray
@playse storage=acid
@image layer=e3 storage=PE_base_flame visible=true mode=psdodge
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 250'
@startemit layer=e3 storage=&'"PE_spray1_" + (attackWay == 1 ? "u" : "d")' time=2000 skip=1000
@wait time=1000
@clearemit layer=e3
@return

*acid_shower
@image layer=e3 storage=screen_deepblue
@image layer=e4 storage=BE_spray2_u clipwidth=800 clipheight=500 mode=addalpha cond='attackWay == 1'
@image layer=e4 storage=BE_spray2_d clipwidth=700 clipheight=384 mode=addalpha cond='attackWay == -1'
@playse storage=acid
@layopt layer=e4 left=50 top=&'targetY - 150' cond='attackWay == 1'
@layopt layer=e4 left=&'targetGroupX - 350' top=448 cond='attackWay == -1'
@anime layer=e4
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@stopanime layer=e4
@freeimage layer=e4
@wait time=200
@return

*acid_sprinkler
@playse storage=acid
@image layer=e3 storage=PE_base_full visible=true mode=psdodge
@startemit layer=e3 storage=PE_spray3 time=2000 skip=1000
@anime layer=e3
@anime_fadein layer=e3
@wait time=1000
@anime_fadeout layer=e3
@stopanime layer=e3
@freeimage layer=e3
@return

*spear_trap
@playse storage=shakin1
@image layer=e3 storage=BE_speartrap visible=true
@layopt layer=e3 top=500 left=260 index=-60
@wait time=50
@layopt layer=e3 top=300
@wait time=50
@layopt layer=e3 top=100
@wait time=20
@layopt layer=e3 top=60 left=259
@wait time=20
@layopt layer=e3 top=60 left=261
@wait time=20
@layopt layer=e3 top=60 left=259
@wait time=20
@layopt layer=e3 top=60 left=261
@wait time=200
@layopt layer=e3 visible=false
@wait time=200
@return

*burner_trap
@playse storage=fire1
@image layer=e4 storage=PE_base_view visible=true
@startemit layer=e4 storage=PE_flame_many
@image layer=e3 storage=screen_deepred visible=true
@anime_fadein layer=e3,e4
@wait time=1000
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@wait time=200
@return

*fountain_poison
@playse storage=liquid
@image layer=e3 storage=screen_bluefull
@image layer=e4 storage=PE_base_party mode=psdodge
@layopt layer=e4 left=0 top=384
@startemit layer=e4 storage=PE_poison_wide time=2000
@anime_fadein layer=e3,e4
@wait time=1500
@anime_fadeout layer=e3,e4
@clearemit layer=e4
@return

*fountain_green
@image layer=e3 storage=screen_bluefull
@image layer=e4 storage=BE_potion_green clipwidth=1000 clipheight=400 mode=dodge
@playse storage=healing
@layopt layer=e4 left=12 top=400
@anime layer=e4
@anime_fadein layer=e3,e4
@wait time=700
@anime_fadeout layer=e3,e4
@stopanime layer=e4
@freeimage layer=e4
@wait time=200
@return

*fountain_star
@playse storage=period
@image layer=e4 storage=PE_base_party left=0 top=540 mode=psdodge5
@startemit layer=e4 storage=PE_stardust_g time=1500
@anime_fadein layer=e4
@wait time=1000
@anime_fadeout layer=e4
@clearemit layer=e4
@return

*barrel_star
@playse storage=period
@return cond='game.curTarget === void'
@image layer=e4 storage=PE_base_flame mode=psdodge5 cond='attackWay == -1'
@layopt layer=e4 left=&'targetX - 150' top=&'targetBottom - 350'
@startemit layer=e4 storage=PE_stardust_m time=1500
@anime_fadein layer=e4
@wait time=1000
@anime_fadeout layer=e4
@clearemit layer=e4
@return

*barrel_poison
@playse storage=liquid
@image layer=e3 storage=PE_base_flame visible=true mode=psdodge
@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 310'
@startemit layer=e3 storage=PE_poison_purple time=2000
@wait time=1500
@anime_fadeout layer=e3
@clearemit layer=e3
@return

*warning
@image layer=e3 storage=screen_deepred
@playse storage=warning
@anime_fadein layer=e3
@wait time=1800
@layopt layer=e3 visible=false
@return

*steal_panties
@eval exp='tf.arr = ["hip", "bust"]'
@jump target=*steal

*steal_equipment
@eval exp='tf.arr = ["main", "sub", "chest", "waist", "arm", "leg", "bust", "hip"]'
@eval exp='tf.arr.shuffle()'
@jump target=*steal

*steal
@eval exp='tf.temp = tf.arr.pop()'
@jump target=*steal cond='tf.temp !== void && ! game.curTarget.hasRemovableEquipment(tf.temp)'
@image layer=e4 storage=BE_wind left=-605 top=250 visible=true
@eval exp='game.curTarget.cutInFigure(FACE["normal"].num, "alternate", 600)'
@wait time=500
@playse storage=byun2
@move layer=e4 path=1024,, time=200
@wm
@wait time=500
@eval exp='game.curFighter.act.result = void'
[if exp='tf.temp !== void']
	@eval exp='game.curFighter.act.result = game.curTarget.equip[tf.temp].name'
	@playse storage=swing1
	@image layer=e5 storage=9999 visible=true
	@wait time=50
	@eval exp='game.curTarget.beStolenEquipment(tf.temp)'
	[if exp='game.curTarget.sex == "女" && ["chest", "waist", "bust", "hip"].has(tf.temp)']
		@eval exp='game.curTarget.cutInFigure(FACE["shy"].num, "none", 600)'
	[else]
		@eval exp='game.curTarget.cutInFigure(FACE["surprise"].num, "none", 600)'
	[endif]
	@layopt layer=e5 visible=false
	@wait time=1000
[endif]
@layopt layer=e4 visible=false
@eval exp='game.cutOutFigure("alternate")'
@return

*tentacle_trap
@wait time=500
@return cond='game.curTarget.getTouchableCrotchsImage() === void'
@eval exp='game.curFighter.data = [m.ローパー, m.ハイパーローパー, m.マンイーター].draw()'
@call target=*tentacle_attack
@return

;----------------------------------------------------------------------------------------
; アイテム・装備破壊

*monster_broken
@wait time=500
@playse buf=1 storage=tear
@image layer=e5 storage=9999 visible=true left=0 top=0
@wait time=100
@eval exp='tf.num = game.enemy.imgSizeRatio[game.curTarget.group.depth * 4]'
@eval exp='game.curTarget.loadImages(game.curTarget.brokenItem.img, tf.num)'
@anime_fadeout layer=e5
@wait time=500
@return

*equipment_broken
@eval exp='game.wordsBase.close()'
@btmes off
@playse buf=1 storage=&'game.curTarget.brokenItem.sound'
@image layer=e5 storage=9999 visible=true left=0 top=0
@image layer=e4 storage=PE_base_broken visible=true mode=psdodge5
@layopt layer=e4 left=&'game.curTarget.getBrokenItemPos()[0] + game.figureLayer.left - 256'
@layopt layer=e4 top=&'game.curTarget.getBrokenItemPos()[1] - 256'
@startemit layer=e4 storage=PE_broken time=200 skip=500
@eval exp='tf.lastPose = "showBust"' cond='tf.lastPose === void'
@eval exp='game.curTarget.cutInFigure(FACE["hurt"].num, "none", game.figureLayer.left,, tf.lastPose)'
@eval exp='game.curTarget.updateByChangeEquipment(game.curTarget.brokenItem)'
	; ↑ 演出上ここに置く
@wait time=50
@move layer=e5 path=,,0 time=1000
@wm
@layopt layer=e5 visible=false opacity=255
@clearemit layer=e4
@return

*item_broken
@playse storage=&'game.curTarget.brokenItemStat > 0 ? "cracking" : game.curTarget.brokenItem.sound' buf=1
@image layer=e5 storage=9999 visible=true left=0 top=0
@wait time=50
@move layer=e5 path=,,0 time=&'game.curTarget.brokenItemStat > 0 ? 100 : 1000'
@wm
@layopt layer=e5 visible=false opacity=255
@return

*break_claw
@eval exp='game.curTarget.cutInFigure(FACE["surprise"].num, "alternate", 600)'
@wait time=600
@playse storage=swing2
@eval exp='tf.weaponImage = "yellow"'
@image layer=e5 storage=BE_bigclaw visible=true left=600 top=150
@anime layer=e5
@wa layer=e5
@layopt layer=e5 visible=false
@wait time=200
@eval exp='tf.cancelAction = game.curTarget.getCancelAction(game.curFighter)'
[if exp='tf.cancelAction !== void']
	@playse buf=1 storage=kira2
	@image layer=e5 storage=9999 visible=true left=0 top=0
	@wait time=100
	@layopt layer=e5 visible=false opacity=255
	@wait time=500
	@eval exp='game.cutOutFigure("alternate")'
	@return
[endif]
@playse buf=1 storage=explosion2
@image layer=e5 storage=9999 visible=true left=0 top=0
@image layer=e4 storage=PE_base_full visible=true mode=psdodge5 left=280 top=-30
@startemit layer=e4 storage=PE_broken2 time=200 skip=500
[if exp='game.curTarget.isUserChara']
	@eval exp='tf.lastPose = "showBust"' cond='tf.lastPose === void'
	@eval exp='game.curTarget.createFigure(FACE["hurt"].num, [], tf.lastPose)'
	@eval exp='game.cutInFigure(game.curTarget.figureLayer, "none", game.figureLayer.left)'
[elsif exp='game.curTarget instanceof "SummonedObject"']
	@eval exp='game.cutOutFigure("none")'
[else]
	@eval exp='tf.temp = "nude_fight" + (game.curTarget.isErected() ? "_erect" : "")'
	@eval exp='game.curTarget.createFigure(FACE["hurt"].num, tf.temp)'
	@eval exp='game.cutInFigure(game.curTarget.figureLayer, "none", game.figureLayer.left)'
[endif]
@wait time=50
@move layer=e5 path=,,0 time=2000
@shake layer=cutin loop=10 length=5 time=50
@wm
@layopt layer=e5 visible=false opacity=255
@clearemit layer=e4
@eval exp='game.cutOutFigure("alternate")'
@return

*shatter_claw
@eval exp='game.curTarget.cutInFigure(FACE["surprise"].num, "alternate", 600)'
@wait time=600
@playse storage=swing2
@eval exp='tf.weaponImage = "pink"'
@image layer=e5 storage=BE_bigclaw visible=true left=600 top=150
@anime layer=e5
@wa layer=e5
@eval exp='tf.cancelAction = game.curTarget.getCancelAction(game.curFighter)'
[if exp='tf.cancelAction !== void']
	@playse buf=1 storage=kira2
	@image layer=e5 storage=9999 visible=true left=0 top=0
	@wait time=100
	@layopt layer=e5 visible=false opacity=255
	@wait time=500
	@eval exp='game.cutOutFigure("alternate")'
	@return
[endif]
@playse buf=1 storage=slash1
@image layer=e5 storage=9999 visible=true left=0 top=0
@image layer=e4 storage=PE_base_full visible=true mode=psdodge5 left=280 top=-30
@eval exp='game.cutOutFigure("none")'
@startemit layer=e4 storage=PE_broken3 time=200 skip=500
@move layer=e5 path=,,0 time=2000
@wm
@layopt layer=e5 visible=false opacity=255
@clearemit layer=e4
@return

*change_equipment
@wait time=1000
@eval exp='o.装備変更.result = false'
@eval exp='game.battleInfo.ready()'
@eval exp='game.itemWin.changeEquipmentsInBattle(game.curFighter)'
[waitinput name="closeInventory"]
@eval exp='game.interruptTurn = false'
@return

;----------------------------------------------------------------------------------------
; スペシャルパワー

*release_special_power
@return cond='game.curItem.special.find(game.curFighter.act) != 0'
	; 複数効果がある場合、この演出は初回のみ
@eval exp='game.cutInFigure(game.curFighter.figureLayer, "alternate", 600,, true)'
@wait time=200
@playse buf=2 storage=kira1
@image layer=e3 storage=screen_blue
@image layer=e4 storage=PE_base_broken visible=false mode=psdodge5
@layopt layer=e4 left=&'game.curFighter.getBrokenItemPos()[0] + game.figureLayer.left - 256'
@layopt layer=e4 top=&'game.curFighter.getBrokenItemPos()[1] - 256'
@startemit layer=e4 storage=PE_linespread2 time=2000 skip=500
@anime_fadein layer=e3,e4
@wait time=2000
@playse buf=2 storage=shakin4
@image layer=e5 storage=9999 visible=false left=0 top=0
@anime_fadein layer=e5
@layopt layer=e3 visible=false
@clearemit layer=e4
@wait time=500
@move layer=e5 path=,,0 time=1000
@wm
@layopt layer=e5 visible=false opacity=255
@return

*sp_change_param
@call target=*release_special_power
@anime_radiate image=yellow se=shuwa1
@return

*sp_change_job
@call target=*release_special_power
@anime_radiate image=green se=magic6
@return

*sp_change_alignment
@call target=*release_special_power
@anime_radiate image=pink se=magic6
@return

*sp_restore_hp
@call target=*release_special_power
@call target=*spell_grand_heal
@return

*sp_restore_mp
@call target=*release_special_power
@call target=*fountain_green
@return

*sp_forget
@call target=*release_special_power
@playse storage=howling
@image layer=e2 storage=screen_blackfull visible=true opacity=64 left=0 top=0
@wait time=40
@layopt layer=e2 opacity=128
@wait time=40
@layopt layer=e2 opacity=192
@image layer=e3 storage=PE_base_large visible=true
@layopt layer=e3 left=550 top=-150
@startemit layer=e3 storage=PE_smoke_magenta time=2000
@wait time=2000
@anime_fadeout layer=e2
@clearemit layer=e3
@return

*sp_stoned
@call target=*release_special_power
@eval exp='game.itemWin.portrait.changeFace(game.curFighter, FACE["surprise"].num)'
@eval exp='game.curFighter.figureLayer.piledCopy(0, 0, game.itemWin, 0, 0, 560, 768)'
@eval exp='game.cutInFigure(game.curFighter.figureLayer, "none", 600)'
@call target=*medusa_eye
@eval exp='game.curFighter.figureLayer.noise(128)'
@eval exp='game.curFighter.figureLayer.colorize(0, 0, 1)'
@eval exp='game.cutInFigure(game.curFighter.figureLayer, "none", 600)'
@return

*sp_dead
@call target=*release_special_power
@eval exp='game.itemWin.portrait.changeFace(game.curFighter, FACE["hurt"].num)'
@eval exp='game.curFighter.figureLayer.piledCopy(0, 0, game.itemWin, 0, 0, 560, 768)'
@eval exp='game.cutInFigure(game.curFighter.figureLayer, "none", 600)'
@image layer=e4 storage=PE_base_small visible=true left=680 top=120
@startemit layer=e4 storage=PE_blood time=600 slot=1
@call target=*killing
@clearemit layer=e4
@return

*sp_ashed
@call target=*release_special_power
@eval exp='game.itemWin.portrait.changeFace(game.curFighter, FACE["surprise"].num)'
@eval exp='game.curFighter.figureLayer.piledCopy(0, 0, game.itemWin, 0, 0, 560, 768)'
@eval exp='game.cutInFigure(game.curFighter.figureLayer, "none", 600)'
@call target=*incinerate_lay
@eval exp='game.curFighter.switchFaceState("ashes")'
@eval exp='game.cutOutFigure("none")'
@image layer=e4 storage=BE_vanishl visible=true left=600 top=0
@anime layer=e4
@wait time=1000
@stopanime layer=e4
@freeimage layer=e4
@wait time=200
@return

;----------------------------------------------------------------------------------------
; その他

*set_bomb
[if exp='game.curFighter.act.result.res == "forbidden"']
	@btmes off
	@playse storage=buzzer
	@notice text=&'game.curFighter.act.result.msg'
	@return storage="battle.ks" target=*skip_process
		; 途中のウエイトをとばすため
[endif]
@eval exp='game.curItem = game.curFighter.act' cond='game.curItem === void'
@image layer=e3 storage=&'"BE_" + game.curItem.img.substr(8)'
@layopt layer=e3 visible=true left=350 top=&'game.inBattle ? 400 : 300'
[if exp='game.map.kind == "dungeon"']
	@layopt layer=e3 visible=false cond='game.map.getWallInfo().secret == "illusion"'
	@layopt layer=e3 visible=false cond='game.map.getNextFloorInfo().darkZone == "smoke"'
[endif]
[if exp='game.curFighter.act.result.res == "success" || game.curFighter.act.result.res == "failed"']
	@layopt layer=e4 top=&'game.inBattle ? 100 : 0'
	@image layer=e4 storage=PE_base_view visible=true mode=psdodge
	@image layer=e5 storage=9999
	@startemit layer=e4 storage=PE_bombsparkle time=1000
	@wait time=1000
	@playse storage=bomber
	@startemit layer=e4 storage=PE_bombfire time=500
	@wait time=200
	@layopt layer=e3 visible=false
	@wait time=300
	@anime_fadein layer=e5
	[if exp='game.inBattle']
		@wait time=500
		@anime_fadeout layer=e5
		@return
	[endif]
	@eval exp='game.updateView()'
	@clearemit layer=e4
	; 破壊イベントチェック
	@eval exp='game.onBombObject = true'
	@eval exp='game.party.lastIsMove = game.party.lastIsTurn = false'
	@return target=*_bomber_event cond='game.checkMapEvent(true)'
	@wait time=500
	@anime_fadeout layer=e5
[elsif exp='game.curFighter.act.result.res == "misfire"']
	@layopt layer=e4 top=100
	@wait time=1000
	@layopt layer=e4 visible=false
	@return
[elsif exp='game.curFighter.act.result.res == "sink"']
	@eval exp='kag.effects[3].height -= 50' cond='game.inBattle'
	@layopt layer=e4 top=&'kag.effects[4].top + 100' cond='game.inBattle'
	@image layer=e4 storage=PE_base_view visible=true mode=psdodge
	@startemit layer=e4 storage=PE_bombsparkle time=2000
	@jump target=*_set_bomb_water
[else]
	; "fall" or "fall and sink"
	@wait time=200
	@layopt layer=e3 top=&'game.view.top + 350'
	@wait time=20
	@image layer=e3 storage=&'"BE_" + game.curItem.img.substr(8)' top=&'game.view.top + 410' clipheight=150
	@wait time=20
	@image layer=e3 storage=&'"BE_" + game.curItem.img.substr(8)' top=&'game.view.top + 500' clipheight=60
	@wait time=20
	@layopt layer=e3 visible=false
	@wait time=1000
	[if exp='game.curFighter.act.result.res == "fall"']
		@playse storage=bomber
		@wait time=500
		@image layer=e4 storage=PE_base_view visible=true top=&'game.view.top'
		@startemit layer=e4 storage=PE_bombsmoke time=1000
		@wait time=2500
		@clearemit layer=e4
		; 破壊イベントチェック
		@eval exp='game.onBombObject = true'
		@eval exp='game.party.lastIsMove = game.party.lastIsTurn = false'
		@return target=*_bomber_event cond='game.checkMapEvent(true)'
	[else]
		; fall and sink
		@playse storage=bashan2
		@wait time=1000
	[endif]
[endif]
@return
*_set_bomb_water
@wait time=30
@layopt layer=e3 top=&'kag.effects[3].top + 5'
@layopt layer=e4 top=&'kag.effects[4].top + 5'
@image layer=e3 storage=BE_bomb clipheight=&'kag.effects[3].height - 5'
@jump target=*_set_bomb_water cond='kag.effects[3].height >= 5'
@layopt layer=e3 visible=false
@image layer=e4 storage=PE_base_view visible=true left=50 top=-50
@startemit layer=e4 storage=PE_bombwater time=200
@wait time=1000
@clearemit layer=e4
@return
*_bomber_event
@eval exp='game.onBombObject = true'
@eval exp='game.curFighter.useResource()'
@eval exp='game.checkMapEvent()'

*view_letter
@return cond='game.inBattle'
@eval exp='game.noReturnMenu = true'
@eval exp='game.rightClickEnabled = false'
@btmes off
@playse storage=paper
@wait time=100
@eval exp='kag.autoRecordPageShowing = false'
@eval exp='kag.skipToPage()'
@ct
@call storage="speech.ks" target=&'"*letter_" + game.curFighter.act.name'
@eval exp='kag.autoRecordPageShowing = true'
@eval exp='game.rightClickEnabled = true'
@wakuset w=0
@return storage="battle.ks" target=*skip_process

*view_mirror
@return cond='game.inBattle'
@return cond='o.全てを見通せる鏡.flag == 1'
@eval exp='game.noReturnMenu = true'
@eval exp='game.rightClickEnabled = false'
@btmes off
@playse storage=period
@wait time=100
@call storage="main11.scn" target=*mirror_1
@return storage="battle.ks" target=*skip_process

*view_encyclopedia
@se f=paper
@wait time=500
@call storage="appendix.ks" target=*monstersList
@eval exp='game.setPrev(game.itemWin.closeTreasureBox)'
@eval exp='game.itemWin.openCollectionOfMonsters()'
@eval exp='game.noReturnMenu = true'
@waitinput name="closeTreasureBox"
@se f=paper
@return storage="battle.ks" target=*skip_process

*anti_magic
@btmes off
@wait time=500
[texton w=0]
[ミレディ f=01]「我要使用禁魔领域咯～～」[k]
[textoff]
@wait time=500
@btmes show
@se f=shakin3
@flash on=500 t=500 off=1000
@se f=period
@return

*press_button
@se f=kacha
@wait time=800
@return

*failed_to_reset
@btmes show
[r]可是什么事都没发生！
@wait time=800
@btmes off
@return

*use_item
@wait time=100
@playse storage=period
@return

*open_box_safety
@playse storage=kacha
@return

*play_sound
@playse buf=2 storage=up1
@return

*nothing
@return

;========================================================================================



;========================================================================================
; プロパティ登録

*register_macro

[iscript]

property targetX
{
	// 目標の中心Ｘを返す
	getter
	{
		return game.curTarget.left + game.curTarget.width \ 2;	// すべてのチームの左端は０
	}
}

property targetY
{
	// 目標の中心Ｙを返す
	getter
	{
		return game.curTarget.parent.top + game.curTarget.top + game.curTarget.height \ 2;
	}
}

property targetTop
{
	// 目標の上端を返す
	getter
	{
		if(game.curTarget.parent == game.party) return 560;
		if(game.curTarget.parent == game.enemy) return game.curTarget.top + game.enemy.top;
		return game.curTarget.parent.top + game.curTarget.top;	// ゲスト
	}
}

property targetBottom
{
	// 目標の下端を返す
	getter
	{
		if(game.curTarget.parent == game.enemy) return 560 - game.curTarget.group.depth * 40;
		if(game.curTarget.parent == game.party) return 768;
		return game.curTarget.parent.top + game.curTarget.top + game.curTarget.height;	// ゲスト
	}
}

property targetGroupX
{
	// 目標グループの横中央位置を返す
	getter
	{
		if(game.curTarget.parent == game.enemy) return 450;
		else return game.curTarget.group.depth * 512 + 256;	// ゲストはパーティーのものに準ずる
	}
}

property targetGroupY
{
	// 目標グループの縦中央位置を返す
	getter
	{
		if(game.curTarget.parent != game.enemy) return 664;	// ゲストはパーティーのものに準ずる
		else return 440 + game.enemy.top - game.curTarget.group.depth * 40;
	}
}

property targetAverageY
{
	// 目標グループの平均高さを返す
	getter
	{
		if(game.curTarget.parent != game.enemy) return 664;	// ゲストはパーティーのものに準ずる
		var y = 0, num = 0;
		for(var i = 0; i < game.curFighter.target.count; i++)
		{
			var one = game.curFighter.target[i];
			if(one.dead) continue;
			y += one.top + one.height \ 2;
			num ++;
		}
		dm("対象の平均高さ   " + (y \ num));
		return y \ num + game.enemy.top;
	}
}

property targetGroupBottom
{
	// 目標グループの下端を返す
	getter
	{
		if(game.curTarget.parent != game.enemy) return 768;	// ゲストはパーティーのものに準ずる
		else return 600 - game.enemy.top -  game.curTarget.group.depth * 40;
	}
}

property attackWay
{
	// ターゲットが敵だったら 1 味方・ゲストだったら -1 を返す
	getter
	{
		if(game.curTarget === void) return 0;
		return game.curTarget.parent != game.enemy ? -1 : 1;
	}
}

property attackToGuest
{
	// ターゲットがゲストだったら true を返す
	getter
	{
		if(game.curTarget === void) return false;
		return game.curTarget.parent == game.guest;
	}
}
[endscript]
;========================================================================================



;========================================================================================
; マクロ登録

; 簡易アニメスタート
@macro name="anime"
	@animstart layer=%layer page=%page seg=%seg|1 target=*start
@endmacro

; 簡易アニメストップ
@macro name="stopanime"
	@animstop layer=%layer page=%page seg=%seg|1
@endmacro

; アニメする前にレイヤーを初期状態に戻す
@macro name="anireset"
	@layopt layer=e0 left=0 top=0 opacity=255 visible=false index=-100
	@layopt layer=e1 left=0 top=0 opacity=255 visible=false index=-50
	@layopt layer=e2 left=0 top=0 opacity=255 visible=false index=-1
	@layopt layer=e3 left=0 top=0 opacity=255 visible=false index=200
	@layopt layer=e4 left=0 top=0 opacity=255 visible=false index=300
	@layopt layer=e5 left=0 top=0 opacity=255 visible=false index=400
@endmacro

; マップ演出・音声を止める
@macro name="stop_map_effect"
	@eval exp='game.view.stopEffect()' cond='game.map.effect !== void'
	@eval exp='game.view.stopMapSound()' cond='game.map.sound !== void'
	@stopbgm cond='game.map.bgm !== void && ! game.inBattle'
@endmacro

; マップ演出を再開する
@macro name="start_map_effect"
	@eval exp='game.view.startEffect(game.map.effect)' cond='game.map.effect !== void'
	@eval exp='game.view.playMapSound(game.map.sound)' cond='game.map.sound !== void'
	@playbgm storage=&'game.map.bgm' cond='game.map.bgm !== void && ! game.inBattle'
@endmacro

; レイヤーをフェードイン
@macro name="anime_fadein"
	@layersopt * opacity=64 visible=true
	@wait time=40
	@layersopt * opacity=128
	@wait time=40
	@layersopt * opacity=192
	@wait time=40
	@layersopt * opacity=255
@endmacro

; レイヤーをフェードアウト
@macro name="anime_fadeout"
	@layersopt * opacity=192
	@wait time=40
	@layersopt * opacity=128
	@wait time=40
	@layersopt * opacity=64
	@wait time=40
	@layersopt * opacity=255 visible=false
@endmacro

; レイヤーが点滅
@macro name="blink"
	@layopt layer=%layer visible=true
	@wait time=&'+mp.time \ 2'
	@layopt layer=%layer visible=false
	@wait time=&'+mp.time \ 2'
	@blink * loop=&'+mp.loop - 1' cond='+mp.loop > 0'
@endmacro

; レイヤーを揺らす カットインを揺らしたいときは layer に "cutin" と指定する
@macro name="shake"
	@eval exp='mp.lay = game.figureLayer' cond='mp.layer == "cutin"'
	@eval exp='mp.lay = kag.getLayerFromElm(mp)' cond='mp.layer != "cutin"'
	@eval exp='mp.lay.left += +mp.length'
	@wait time=&'+mp.time \ 2'
	@eval exp='mp.lay.left -= +mp.length'
	@wait time=&'+mp.time \ 2'
	@shake * loop=&'+mp.loop - 1' cond='+mp.loop > 0'
@endmacro

; 文字が飛び出す
@macro name="anime_number"
	@eval exp='mp.temp = new LivingObjectLayer(game.view, game, 0)'
	@eval exp='mp.temp.numberLayer.setPos(+mp.left, +mp.top)'
	@eval exp='mp.color = 0xFFFFFF' cond='mp.color === void'
	@eval exp='mp.temp.damageAnim("0," + mp.color + "," + mp.text)'
	@wait time=400
	@eval exp='invalidate mp.temp'
@endmacro

; 攻撃アニメ全般・とりあえず１ファイル読み込んでアニメさせる
; left, top は対象の中心を基準にして指定する
@macro name="anime_attack"
	@playse storage=%se
	@image layer=e3 storage=%storage visible=true
	@layopt layer=e3 left=&'targetX + +mp.left' top=&'targetY + +mp.top'
	@anime layer=e3
	@wa layer=e3
	@layopt layer=e3 visible=false
@endmacro

; パンチ（１回分・ loop の数だけ繰り返す）
@macro name="anime_beat"
	@playse storage=%se
	@layopt layer=%layer left=&'targetX - kag.getLayerFromElm(mp).width \ 2 + intrandom(-50, 50)'
	@layopt layer=%layer top=&'targetY - kag.getLayerFromElm(mp).height \ 2 + intrandom(-50, 50)'
	@layopt layer=%layer visible=true
	@wait time=50
	@layopt layer=%layer visible=false
	@wait time=20
	@anime_beat layer=%layer se=%se loop=&"+mp.loop - 1" cond="+mp.loop > 1"
@endmacro

; 汎用弓矢
@macro name="anime_arrow"
	@eval exp='tf.weaponImage = mp.image'
	@image layer=e3 storage=BE_arrow mode=%mode flipud=&'attackWay < 0' visible=true
	@layopt layer=e3 left=&'targetX - 15'
	@layopt layer=e3 top=&'targetY + 200 * attackWay - 90 * (attackWay < 0)'
	@wait time=20
	@eval exp='kag.effects[3].top += -100 * attackWay'
	@wait time=20
	@eval exp='kag.effects[3].top += -100 * attackWay'
	@wait time=20
	@playse storage=%se
	@anime layer=e3
	@wa layer=e3
	@freeimage layer=e3
@endmacro

; 汎用飛び道具演出・敵に向かって飛んでいく（ mp.left, mp.top は微調整用 ）
@macro name="anime_missile"
	@playse storage=%se
	@image layer=e3 storage=%storage mode=%mode flipud=&'attackWay < 0' visible=true
	@anime layer=e3 cond='+mp.anime'
	@layopt layer=e3 left=&'+mp.left + targetX - kag.effects[3].width \ 2'
	@layopt layer=e3 top=&'+mp.top + targetY + 200 * attackWay - kag.effects[3].height * (attackWay < 0)'
	@wait time=%time|20
	@eval exp='kag.effects[3].top += -40 * attackWay'
	@wait time=%time|20
	@eval exp='kag.effects[3].top += -40 * attackWay'
	@wait time=%time|20
	@eval exp='kag.effects[3].top += -40 * attackWay'
	@wait time=%time|20
	@eval exp='kag.effects[3].top += -40 * attackWay'
	@wait time=%time|20
	@eval exp='kag.effects[3].top += -40 * attackWay'
	@wait time=%time|20
	@stopse
	@layopt layer=e3 visible=false
	@stopanime layer=e3 cond='+mp.anime'
	@freeimage layer=e3 cond='+mp.anime'
@endmacro

; 汎用飛び道具演出・列を横に一閃（ mp.left, mp.top は微調整用 ）
@macro name="anime_boomerang"
	[if exp='+mp.loop == 0']
		@playse storage=%se
		@image layer=e3 storage=%storage mode=%mode visible=true
		@anime layer=e3 cond='+mp.anime'
		@layopt layer=e3 left=0 top=&'+mp.top + targetGroupY - kag.effects[3].height * (attackWay > 0)'
	[endif]
	@wait time=%time|20
	@eval exp='kag.effects[3].left += 40, +mp.loop ++'
	@anime_boomerang * loop=&'+mp.loop' cond='+mp.loop < 24'
	[if exp='+mp.loop == 24']
		@layopt layer=e3 visible=false
		@stopanime layer=e3 cond='+mp.anime'
		@freeimage layer=e3 cond='+mp.anime'
	[endif]
@endmacro

; 汎用エナジーサークル
@macro name="anime_circle"
	@eval exp='tf.weaponImage = mp.image'
	@wait time=100
	@playse storage=%se|magic6
	@image layer=e3 storage=BE_circle mode=%mode|psadd
	@layopt layer=e3 left=&'targetX - 150' opacity=0 visible=true
	@anime layer=e3
	@wa layer=e3
	@layopt layer=e3 visible=false
	@freeimage layer=e3
@endmacro

; 汎用発光演出
@macro name="anime_radiate"
	@eval exp='tf.weaponImage = mp.image'
	@anireset
	@image layer=e3 storage=BE_radiate1 mode=psdodge5 cond='! +mp.wide && attackWay == -1 && ! attackToGuest'
	@image layer=e3 storage=BE_radiate2 mode=psdodge5 cond='! +mp.wide && (attackWay == 1 || attackToGuest)'
	@image layer=e3 storage=BE_radiate3 mode=psdodge5 cond='+mp.wide && attackWay == -1'
	@image layer=e3 storage=BE_radiate4 mode=psdodge5 cond='+mp.wide && attackWay == 1'
	@layopt layer=e3 left=&'targetX - 120' top=524 cond='! +mp.wide && attackWay == -1 && ! attackToGuest'
	@layopt layer=e3 left=&'targetX - 150' top=&'targetY - 150' cond='! +mp.wide && (attackWay == 1 || attackToGuest)'
	@layopt layer=e3 left=0 top=488 cond='+mp.wide && attackWay == -1'
	@layopt layer=e3 left=50 top=110 cond='+mp.wide && attackWay == 1'
	@layopt layer=e3 visible=true
	@playse storage=%se
	@anime layer=e3
	@wa layer=e3
	@layopt layer=e3 visible=false
@endmacro

; 決闘標示を表示・非表示
@macro name="anime_duel_sign"
	[if exp='+mp.visible']
		@image layer=0 storage=image_duel_frame visible=true left=0 top=0
		@wait time=1000
		@image layer=1 storage=&'"image_duel_" + game.curTeam.img' visible=true left=74 top=177 opacity=255
		@wait time=2000
		@image layer=0 storage=image_duel_mark left=866
		@image layer=1 storage=image_duel_sign left=893 top=100
		@animstart layer=1 seg=1 target=*start
	[else]
		@layopt layer=0 page=back visible=false left=0
		@layopt layer=1 page=back visible=false opacity=255 left=0 top=0
		@animstop layer=1 seg=1
		@freeimage layer=1
		@freeimage page=back layer=1
		@forelay
	[endif]
@endmacro

; 決闘用の網を表示・非表示
@macro name="anime_duel_net"
	@se f=byun1 cond='+mp.visible'
	@image layer=9 page=back storage=9999 visible=true left=0 top=0
	@trans method=universal rule=rule_48 time=500
	@wt
	@cl b
	@layopt layer=9 page=back visible=false
	[if exp='game.view == game.dungeonView']
		@eval exp='game.view.bufScreen.duelNet.visible = +mp.visible'
	[else]
		@eval exp='game.gameVisible = true'
		@eval exp='game.backScreen.loadImages(mp)' cond='+mp.visible && mp.storage !== void'
		@eval exp='game.backScreen.visible = (+mp.visible && mp.storage !== void)'
	[endif]
	@eval exp='game.updateView()'
	@wait time=200
	@trans method=universal rule=rule_48 time=500
	@wt
	@wait time=500
@endmacro

; マロール
@macro name="anime_malor"
	@wait time=500
	@playse storage=byun2
	@image layer=e3 storage=9999 left=0 top=0
	@anime_fadein layer=e3
	@eval exp='game.updateView()'
	@eval exp='game.enemy.disappear()' cond='+mp.clearenemy'
	@wait time=500
	@eval exp='game.cutOutFigure("alternate")'
	@anime_fadeout layer=e3
	@wait time=100
@endmacro

; 出血
@macro name="blood"
	@se f=%se|slash1
	@image layer=9 storage=BE_blood visible=true
	@wait time=500
	@layopt layer=9 visible=false
@endmacro

; 打撃
@macro name="crash"
	@se f=shakin6
	@image layer=8 page=back storage=SE_crash1 visible=true
	@trans method=crossfade time=0
	@wt
	@quake time=300 hmax=35 vmax=28
	@wq
	@layopt layer=8 page=back visible=false
	@trans method=crossfade time=0
	@wt
@endmacro

; 打撃
@macro name="beat"
	@se f=beat
	@quake time=100 hmax=60 vmax=60
	@flash time=100
	@wait time=&'mp.time !== void ? mp.time : intrandom(200, 800)'
@endmacro

;========================================================================================
; 登録おわり
@return
