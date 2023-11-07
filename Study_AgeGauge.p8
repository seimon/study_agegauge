pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
#include study_agegauge.lua
__gfx__
fff0000000ab0000000fffffff00000fffff77ff000000000000000000000000000000000000000000000000fffffffffffffffffffff00fffffffffffffffff
ff07aaaaaabbaaaaaaa0fffff0777770fff777ff000000000000000000000000000000000000000000000000ffff00ffffffffffffff0720ffffffffffffffff
f07bbbbbbbbbbbbbbbbb0fff072222220f7777ff000000000000000000000000000000000000000000000000fff0720ffffffffffff077720fffffffffffffff
0abbbbbbbbaabbbbbbbb30f07220002240f777ff000000000000000000000000000000000000000000000000ff077720fffffffffff077770fffffffffffffff
0abbbbbbbabb3bbbbbbb3000720fff0240ff77ff000000000000000000000000000000000000000000000000ff0777720fffffffffff077720ffffffffffffff
0abbb00bbb33bbb00bbb3000720fff0240ffffff000000000000000000000000000000000000000000000000fff077772000ffffffff07772000ffffffffffff
0abb000bbbaabbb000bb3000720fff0240ffffff000000000000000000000000000000000000000000000000ffff07772072000ffffff0772072000fffffffff
0ab0000bbabb3bb0000b30007220002240ffffff000000000000000000000000000000000000000000000000fffffffffffffffffffff077207207200fffffff
0abb000bbb33bbb000bb300f022222240fffffff0000000000000000000000000000000000000000000000000000000000000000fff000772072072020ffffff
0abbb00bbbaabbb00bbb300ff0444440ffffffff0000000000000000000000000000000000000000000000000000000000000000ff07707777720720720fffff
0abbbbbbbabb3bbbbbbb300fff00000fffffffff0000000000000000000000000000000000000000000000000000000000000000f0777077777777207200ffff
0abbbbbbbb33bbbbbbbb300fffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000f0772077777777727200ffff
f0bbbbbbbbbbbbbbbbb3000fffffffffffffffff000000000000000000000000000000000000000000000000000000000000000007772077777777272220ffff
ff03333333333333333000ffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000077207777777777272200fff
fff000000000000000000fffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000027777777777772722200fff
ffff0000000000000000ffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000027777777777277272200fff
ffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f02777777777772722000fff
fff6f6ffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f0277777777272722200ffff
ff6fff6fffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ff027777777777222000ffff
f6fffff6ffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff0277777727222000fffff
6fffffff6fffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff027777777272200ffffff
f6fffff6ffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff077777772722200ffffff
ff6fff6fffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffff07777777222000ffffff
fff6f6ffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffff007777220000fffffff
ffff6fffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffff0000000000ffffffff
ffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffff000000ffffffffff
ffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff
ffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff027777727722200ffffff
ffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000fff027777777272200ffffff
ffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff
ffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff
ffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff
22002002222200222222222222222222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20ee0ee022207a022222222222dd2dd2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ef8e8880207bba0222222222d55d555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e888888000abbba022222222d555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20888880000abbbba022222222555552000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
20088800000abbbbb002222222255522000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22008000020abbbb6000222222225222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22200000220abbb60000222222222222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22220002220abb600002222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22222022222066000022222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22222222222200000222222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22222222222220002222222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22222222222222222222222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22222222222222222222222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22222222222222222222222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22222222222222222222222200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllll
lllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglgllllllll
llllllllglllllllllglllllllllggggggllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllll
lllllllglglllllllglglllllllgguuuoogllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglgllllllll
llllllglllglllllglllglllllggufuuuoogglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllll
llllllllllllllllllllllllllguf7fuuuooglllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllguufuuuuooglllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllguuuuuuuooggllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllgouuuuuoooggllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllgoouuuooooggllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllglllglllllglllglllllggooooooogglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllll
lllllllglglllllllglglllllllggooooogggglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglgllllllll
llllllllglllllllllglllllllllggggggglllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllll
lllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglgllllllll
llllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllrlll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllgl
lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllrllllll
llllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglglllll
lllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllrlgllllllll
llllllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllllggllllllll
lllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglgllllrllglgllllllll
llllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllgllllgglllglllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllrlllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllrlllllglllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllrllllglllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllgllrglllglglllglllllglllglllllll
lllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglgllllllll
llllllllglllllllllglggggglllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllllglllllllrlgllgllllllglllllllllglllllllll
lllllllglglllllllglgtttiiglglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglglllllllglgllllllll
llllllglllglllllglgtetttiiglllglllllglllggggggggglglllllglllglllllglllglllllglllglllllglllglrlllggllglllllglllglllllglllglllllll
lllllllllllllllllgte7etttiigllllllllllllgrrrrrrrgglllllllllllllllllllllllllllllgggggllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllgttettttiigllllllllllllg3rrrrr3ggglllllllllllllllllllllllllllg333jjgllllrllllglllllllllllllllllllllllllllllllll
lllllllllllllllllgtttttttiigllllllllllllg33rrr33gggglllllllllllllllllllllllllg3r333jjgllllglllllllllllllllllllllllllllllllllllll
lllllllllllllllllgitttttiiigllllllllllllg3333333ggggglllllllllllllllllllllllg3r7r333jrglllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllgiitttiiiigllllllllllllg33jjj33ggggggllllllllllllllllllllllg33r3333jjggllllllllllllllllllllllllllllllllllllllll
llllllglllglllllglgiiiiiiiggllglllllglllg3jjjjj3ggggggllglllglllllglllglllllg3333333jjglllglllllglllglllllglllglllllglllglllllll
lllllllglglllllllglgiiiiiggglglllllllglggjjjjjjjgggggglllglglllllllglgllllllgj33333jjjgglglllllllglglllllllglglllllllglgllllllll
llllllllglllllllllglggggggglglllllllllglggggggggggggggllllglllllllllglllllllgjj333jjjjggglllllllllglllllllllglllllllllglllllllll
lllllllglglllllllglgllgggllglglllllllglggrrrrrrrgggggglllglglllllllglglllllllgjjjjjjjggglglllllllglglllllllglglllllllglgllllllll
llllllglllglllllglllglllllglllglllllglllg3rrrrr3ggggggllglllglllllglllglllllg5gjjjjjggglllglllllglllglllllglllglllllglllglllllll
llllllllllllllllllllllllllllllllllllllllg33rrr33gggggglllllllllllllllllllllll55gggggggglllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllggggglllllllg3333333gggggglllllllllllllllllllllll55555ggglllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllgtttiigllllllg33jjj33ggggggllllllllllllllllllllllll5l5555llllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllgtetttiiglllllg3jjjjj3gggggglllllllllllllllllllllll5555555llllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllgte7etttiigllllgjjjjjjjgggggglllllllllllllllllllllll5555555llllllllllllllllllllllllllllllllllllllllllll
llllllglllglllllglllgllllgttettttiigglllggggggggggggggllglllglllllglllglllllg555g555llglllglllllglllglllllglllglllllglllglllllll
lllllllglglllllllggglllllgtttttttiiglglggrrrrrrrgggggglllglglllllllglglllllllg5g555llllglglllllllglglllllllglglllllllglgllllllll
llllllllglllllllllgllllllgitttttiiigglglg3rrrrr3ggggggllllglllllllllglllllllllg5555lllllglllllllllglllllllllglllllllllglllllllll
lllllllglglllllllglglllllgiitttiiiiggglgg33rrr33gggggglllglglllllllglglllllllglg555llllglglllllllglglllllllglglllllllglgllllllll
llllllglllglllllglllglllllgiiiiiiiggglllg3333333ggggggllglllglllllglllglllllgll5g55lllglllglllllglllglllllglllglllllglllglllllll
lllllllllllllllllllllllllllgiiiiigggllllg33jjj33ggggggllllllllllllllllllllllllll555lllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllggggggggllllg3jjjjj3ggggggllllllllllllllllllllllll5l555lllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllgggllllllgjjjjjjjgggggglllllllllllllllllllll55555555lllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllgggggggggggggglllllllllllllllllllll5555555llllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllgrrrrrrrgggggglllllllllllllllllllll5555555llllllllllllllllllllllllllllllllllllllllllllll
llllllglllglllllglllglllllglllglllllglllg3rrrrr3ggggggllglllglllllglllgllll5g555g5llllglllglllllglllglllllglllglllllglllglllllll
lllllllglglllllllglglllllllglglllllllglgg33rrr33gggggglllglglllllllglglllll55g5g55lllllglglllllllglglllllllglglllllllglgllllllll
llllllllglllllllllglllllllllglllllllllglg3333333ggggggllllglllllllllgllllll555gl55llllllglllllllllglllllllllglllllllllglllllllll
lllllllglglllllllglglllllllglglllllllglgg33jjj33gggggglllglglllllllglglllll55g5g55lllllglglllllllglglllllllglglllllllglgllllllll
llllllglllglllllglllglllllglllglllllglllg3jjjjj3ggggggllglllglllllglllglll55g555g5llllglllglllllglllglllllglllglllllglllglllllll
llllllllllllllllllllllllllllllllllllllllgjjjjjjjggggggllllllllllllllllllll55l5555lllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllgggggggggggggglllllllllllllllllllll555555lllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllgrrrrrrrggggggllllllllllllllllllllllll555lllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllg3rrrrr3ggggggllllllllllllllllllllllllll5lllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllg33rrr33gggggglllllllllllllllllllllllll55lllllllllllllllllllllllllllllllllllllllllllllll
llllllglllglllllglllglllllglllglllllglllg3333333ggggggllglllglllllglllg555llgll5glllllglllglllllglllglllllglllglllllglllglllllll
lllllllglglllllllglglllllllglglllllllglgg33jjj33gggggglllglglllllllglg55555llg5glllllllglglllllllglglllllllglgllllllggggglllllll
llllllllglllllllllglllllllllglllllllllglg3jjjjj3ggggggllllglllllllllgl55555555g5llllllllglllllllllglllllllllgllllllgtttiigllllll
lllllllglglllllllglglllllllglglllllllglggjjjjjjjgggggglllglglllllllg5gl555555g5glllllllglglllllllglglllllllglgllllgtetttiiglllll
llllllglllglllllglllglllllglllglllllglllggggggggggggggllglllglllllglllgl555lg5llggggggggggggggggggggggggglglllgllgte7etttiigllll
llllllllllllllllllllllllllllllllllllllllgrrrrrrrgggggglllllllllllllllllll555llllgrrrrrrrgrrrrrrrgrrrrrrrgglllllllgttettttiigllll
llllllllllllllllllllllllllllllllllllllllg3rrrrr3ggggggllllllll55llllllllllllllllg3rrrrr3g3rrrrr3g3rrrrr3gggllllllgtttttttiigllll
llllllllllllllllllllllllllllllllllllllllg33rrr33gggggglllllll55lllllllllllllllllg33rrr33g33rrr33g33rrr33gggglllllgitttttiiigglll
llllllllllllllllllllllllllllllllllllllllg3333333ggggggllllllll5lllllll5lllllllllg3333333g3333333g3333333gggggllllgiitttiiiigglll
llllllllllllllllllllllllllllllllllllllllg33jjj33ggggggllllllll5lllll5lllllllllllg33jjj33g33jjj33g33jjj33ggggggllllgiiiiiiiggglll
llllllglllglllllglllglllllglllglllllglllg3jjjjj3ggggggllglllgl55llglllglllllglllg3jjjjj3g3jjjjj3g3jjjjj3gggggggllllgiiiiigggllll
lllllllglglllllllglglllllllglglllllllglggjjjjjjjgggggg55lglgl55llllglggggglllglggjjjjjjjgjjjjjjjgjjjjjjjggggggllllllggggggggllll
llllllllglllllllllglllllllllglllllllllglgggggggggggggg5555gl555lllllgtttiiglllglggggggggggggggggggggggggggggggllllllllggggllllll
lllllllglglllllllglglllllllglglllllllglglggggggggggggg555g5gl55llllgtetttiiglglggrrrrrrrgrrrrrrrgrrrrrrrgggggglllllllglgllllllll
llllllglllglllllglllglllllglllglllllglllglggggggggggggl5g555glllllgte7etttiiglllg3rrrrr3g3rrrrr3g3rrrrr3ggggggglllllglllglllllll
lllllllllllllllllllllllllllllllllllllllllllggggggggggg5555llllllllgttettttiiglllg33rrr33g33rrr33g33rrr33ggggggllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllll5gggggggggg5lllllllllllgtttttttiiglllg3333333g3333333g3333333ggggggllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllll555lgggggggggllllllllllllgitttttiiiggllg33jjj33g33jjj33g33jjj33ggggggllllllllllllllllll
lllllllllllllllllllllllllllllllllllllll55555555lll555lllllllllllllgiitttiiiiggllg3jjjjj3g3jjjjj3g3jjjjj3ggggggllllllllllllllllll
lllllllllllllllllllllllllllllllllllll5l555555lll5555lllllllllllllllgiiiiiiigggllgjjjjjjjgjjjjjjjgjjjjjjjggggggllllllllllllllllll
llllllglllglllllglllglllllglllgllll5g55lgl55llglllglllllglllglllllglgiiiiiggglllggggggggggggggggggggggggggggggglllllglllglllllll
lllllllglglllllllglglllllllglgllll5llg5g5555lllglglllllllglglllllllglggggggggglggrrrrrrrgrrrrrrrgrrrrrrrgggggglllllllglgllllllll
lllllllgggggllllllglllllllllglllllllllg55l55llllglllllllllglllllllllglllggglllglg3rrrrr3g3rrrrr3g3rrrrr3ggggggllllllllglllllllll
llllllgtttiigllllglglllllllglg5llllllglg5l5llllglglllllllglglllllllglglllllllglgg33rrr33g33rrr33g33rrr33gggggglllllllglgllllllll
lllllgtetttiigllglllglllllg555glllllgll5g5llllglllgllllgggggglllllglllglllllglllg3333333g3333333g3333333ggggggglllllglllglllllll
llllgte7etttiiglllllllllll55555lllllllllllllllllllllllgtttiiglllllllllllllllllllg33jjj33g33jjj33g33jjj33ggggggllllllllllllllllll
llllgttettttiiglllllllll5555l5lllll5lllllllllllllllllgtetttiigllllllllllllllllllg3jjjjj3g3jjjjj3g3jjjjj3ggggggllllllllllllllllll
llllgtttttttiiglllllll55l5555lllll5lllllllllllllllllgte7etttiiglllllllllllllllllgjjjjjjjgjjjjjjjgjjjjjjjggggggllllllllllllllllll
llllgitttttiiiggllllll555ll55lllllllllllllllllllllllgttettttiiglllllllllllllllllggggggggggggggggggggggggggggggllllllllllllllllll
llllgiitttiiiiggllllllllllllllllllllllllllllllllllllgtttttttiigllllllllllllllllllgggggggggggggggggggggggggggggllllllllllllllllll
lllllgiiiiiiigggglllgllll5glllglllllglllglllllglllglgitttttiiiggllglllglllllglllglggggggggggggggggggggggggggggglllllglllglllllll
llllllgiiiiigggllglglllll5lglglllllllglglllllllglgllgiitttiiiigglllglglllllllglglllggggggggggggggggggggggggggglllllllglgllllllll
lllllllgggggggglllgllllll5llglllllllllglllllllllgllllgiiiiiiigggllllglllllllllglllllggggggggggggggggggggggggggllllllllglllllllll
lllllllglggggllllglglllllllglglllllllglglllllllglgllllgiiiiigggllllglglllllllglglllllggggggggggggggggggggggggglllllllglgllllllll
llllllglllglllllglllglllllglllglllllglllglllllglllgllllgggggggglllglllglllllglllglllllglllglllllglllglllllglllglllllglllglllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllggglllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllgggggllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllgtttiiglllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllgtetttiigllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllglllglllllglllglllllglllglllllglllglllllglllglllllglgte7etttiiglglllllglllglllllglllglllllglllglllllglllglllllglllglllllll
lllllllglglllllllglglllllllglglllllllglglllllggggglllllllggttettttiigglllllllglglllllllglglllllllglglllllllglglllllllglgllllllll
llllllllglllllllllglllllllllglllllllllglllllgtttiiglllllllgtttttttiiglllllllllglllllllllglllllllllglllllllllglllllllllglllllllll
lllllllglglllllllglglllllllglglllllllglglllgtetttiiglllllggitttttiiigglllllllglglllllllglglllllllglglllllllglglllllllglgllllllll
llllllglllglllllglllglllllglllglllllglllglgte7etttiiglllglgiitttiiiiggglllllglllglllllglllglllllglllglllllglllglllllglllglllllll
llllllllllllllllllllllllllllllllllllllllllgttettttiigllllllgiiiiiiigggllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllgtttttttiiglllllllgiiiiiggglllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllgitttttiiigglllllllgggggggglllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllgiitttiiiiggllllllllllggglllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllllgiiiiiiigggllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
llllllllllllllllllllllllllllllllllllllllllllgiiiiiggglllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll
lllllllllllllllllllllllllllllllllllllllllllllgggggggglllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll

__sfx__
000300003d7503b0403d7303b0303d7203b0203d7103b0103d7103b0103d7103b01036a003e7003e7003e70000000000000000000000000000000000000000000000000000000000000000000000000000000000
0003000016750165501674016540167301653016720165201671016510167101651036a003e7003e7003e70000000000000000000000000000000000000000000000000000000000000000000000000000000000
000300003d7503d7503d7503d7403d7403d7303d7303d7203d7203d7103d7103d7103d7103d7103d7103d71000000000000000000000000000000000000000000000000000000000000000000000000000000000
0004000007750095500b7500d550107501255015750175501a7501c5501f7502255026750295502d7503055034750000000000000000000000000000000000000000000000000000000000000000000000000000
000400001505012550100500e5500c0500a5500905008540070400553005030055200502005510050100551005010000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00040000190501d550220502355028050285502e0502d5503204031540360303453039020365203b0103651000000000000000000000000000000000000000000000000000000000000000000000000000000000
00040000300502a55025050205501b0501755014050115500f0400d5400b0300a5300802007520070100651000000000000000000000000000000000000000000000000000000000000000000000000000000000
000400001905016750220501f75028050247502e05029750320402e740360303073039020337203b0103471000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000300002a0402e730160201a71028000247002e00029700320002e700360003070039000337003b0003470000000000000000000000000000000000000000000000000000000000000000000000000000000000
00030000300402e730300202e71028000247002e00029700320002e700360003070039000337003b0003470000000000000000000000000000000000000000000000000000000000000000000000000000000000
