--[[

Age Wheel Prototyping

]]

ver="0.9"
poke(0x5f5c,12) poke(0x5f5d,3) -- input delay initial&repeating (default 15, 4)
poke(0x5f2d,0x1) -- mouse input enable





-- sspr + scale9
function sspr9(sx,sy,sw,sh,dx,dy,dw,dh,fill_center)
	local cw,ch=flr(sw/2),flr(sh/2)
	sspr(sx,sy,cw,ch,dx,dy,cw,ch) -- lt
	sspr(sx+cw,sy,1,ch,dx+cw,dy,dw-cw*2,ch) -- ct
	sspr(sx+cw+1,sy,cw,ch,dx+dw-cw,dy,cw,ch) -- rt
	sspr(sx,sy+ch,cw,1,dx,dy+ch,cw,dh-ch*2) -- lc
	if(fill_center) sspr(sx+cw,sy+ch,1,1,dx+cw,dy+ch,dw-cw*2,dh-ch*2) -- cc
	sspr(sx+cw+1,sy+ch,cw,1,dx+dw-cw,dy+ch,cw,dh-ch*2) -- rc
	sspr(sx,sy+ch+1,cw,ch,dx,dy+dh-ch,cw,ch) -- lb
	sspr(sx+cw,sy+ch+1,1,ch,dx+cw,dy+dh-ch,dw-cw*2,ch) -- cb
	sspr(sx+cw+1,sy+ch+1,cw,ch,dx+dw-cw,dy+dh-ch,cw,ch) -- rb
end

function printa(t,x,y,c,align,shadow) -- 0.5 center, 1 right align
	x-=align*4*#(tostr(t))
	if (shadow) ?t,x+1,y+1,0
	?t,x,y,c
end

function _init()
	-- 팔레트는 보너스 색상과 섞어서 사용
	-- https://www.lexaloffle.com/bbs/?pid=68190#p
	pal({[0]=128,130,6,3,13,133,9,7,136,5,138,139,14,141,142,15},1)

	age={
		min=10, max=99,
		to=10,
		before=10,
		current=10,
		ratio_to=0,
		ratio=0,
		ratio_spd=0,
		intv=0,
	}
	handle={
		tx_def=63,
		tx=63,
		x=63,
		hitbox={0,0,0,0},
		hover=false,
		drag=false,
		dragfrom={x=0,y=0},
	}
	m={x=128,y=128,lb=0,rb=0}
	hand={x=128,y=128}
end

function _update60()

	-- arrow key
	if age.intv>0 then
		age.intv-=1
	else
		if (btn(0)) then age.to=max(age.to-1,age.min) age.intv=8 handle.tx=handle.tx_def-3
		elseif (btn(1)) then age.to=min(age.to+1,age.max) age.intv=8 handle.tx=handle.tx_def+3
		else handle.tx=handle.tx_def end
	end

	age.current=mid(flr(age.to+.5),age.min,age.max)
	if age.current!=age.before then
		sfx(11,-1)
		age.before=age.current
	end

	-- mouse info
	m.x,m.y,m.lb=stat(32),stat(33),stat(34)
	
	-- update handle's hover state
	handle.hover=(m.x>=handle.hitbox[1] and m.x<=handle.hitbox[3] and m.y>=handle.hitbox[2] and m.y<=handle.hitbox[4]) or handle.drag

	-- drag state
	if (not handle.drag and handle.hover and m.lb==1) then handle.drag=true handle.dragfrom={x=m.x,y=m.y} end
	if handle.drag then
		if m.lb!=1 then -- mouse lb release
			handle.drag=false
			age.to=flr(age.to+.5)
		else
			local dx=mid(m.x-handle.dragfrom.x,-35,35)
			handle.tx=handle.tx_def+abs(dx)^.6*(dx<0 and -1 or 1) -- 멀리 당길수록 덜 따라오게(고무줄 느낌?)
			age.to=mid(age.to+dx*.007,age.min,age.max)
		end
	end
end

function _draw()
	cls(5)

	printa("age wheel prototyping",2,2,7,0,true)
	printa("v"..ver,2,9,7,0,true)

	-- local x,y,w,h=18,40,92,24 -- gauge pos, size
	local x,y,w,h=18,40,92,27 -- gauge pos, size
	rectfill(x,y,x+w,y+h,8) -- bg
	rectfill(x,y,x+5,y+h,13)	rectfill(x+w-5,y,x+w,y+h,13)
	fillp(0b0000101000001000.1) rectfill(x+6,y,x+10,y+h,13) rectfill(x+w-10,y,x+w-6,y+h,13) fillp()
	fillp(0b0101101001011010.1) rectfill(x+11,y,x+15,y+h,13) rectfill(x+w-15,y,x+w-11,y+h,13) fillp()
	fillp(0b1101111101111111.1) rectfill(x+16,y,x+20,y+h,13) rectfill(x+w-20,y,x+w-16,y+h,13) fillp()
	
	-- border
	palt(0b0000000000000001) sspr9(23,0,11,11,x-4,y-4,w+9,h+9) palt()
	
	-- inside top oval cover
	-- clip(x,y,w+1,10)
	-- for i=0,6 do oval(x-8,y+0-i,x+w+8,y+26-i,0) end
	clip(x,y,w+1,10)
	for i=0,7 do oval(x-8,y+2-i,x+w+8,y+30-i,0) end

	-- inside bottom oval over + gradations + glass eff
	-- clip(x,y,w+1,h+1)
	clip(x+1,y,w-1,h+1)
	ovalfill(x+4,y+h-3,x+w-4,y+h+14,0)
	do
		local cx,w0,h0,gap=x+w/2-.5,8,16,1
		age.ratio_to=(age.to-age.min)/(age.max-age.min)
		age.ratio_spd=(age.ratio_to-age.ratio)*.05+age.ratio_spd*.65
		age.ratio+=age.ratio_spd
		if (abs(age.ratio_spd)<.0001) age.ratio=age.ratio_to

		for i=0,age.max-age.min do
			local x0=cx+i*(w0+gap) - age.ratio*(age.max-age.min)*(w0+gap)
			if x0>x-w0 and x0<x+w+w0 then
				local dy=(i<7) and (i-7)*2 or 0
				local oy=y-cos(abs(63-x0)*.005)*8+12
				local dx=abs(cx-x0) -- dist from center
				-- if (i%10==0) line(x0,oy-1,x0,oy+h0+3,13) -- draw line every 10 step
				rectfill(x0-3,oy+2-dy,x0+w0-4,oy+h0,dx>37 and 8 or dx>26 and 14 or 6)
				if (dx>12 and dx<26) fillp(0b0101101001011010.1) rectfill(x0-3,oy+2-dy,x0+w0-4,oy+h0,14) fillp()
			end
		end
		clip()

		-- side shadow
		fillp(0b0101101001011010.1)
		rectfill(x,y,x+2,y+h+1,0)
		rectfill(x+w-2,y,x+w,y+h+1,0)
		fillp(0b1101111101111111.1)
		rectfill(x+3,y,x+6,y+h+1,0)
		rectfill(x+w-3,y,x+w-6,y+h+1,0)
		fillp()

		-- glass eff
		fillp(0b0101101001011010.1)
		for i=0,10 do line(x+14+i,y,x+4+i,y+h,7) end
		for i=0,2 do line(x+28+i,y,x+18+i,y+h,7) end
		for i=0,4 do line(x+w-8+i,y,x+w-18+i,y+h,7) end
		fillp()
		-- glass highlight
		--[[ line(x+1,y,x+w-1,y,7)
		line(x,y+1,x,y+h-1,7)
		line(x+1,y+h,x+w-1,y+h,4)
		line(x+w,y+1,x+w,y+h-1,4) ]]
		line(x+1,y,x+24,y,7) line(x+28,y,x+36,y,7)
		line(x,y+1,x,y+7,7) line(x,y+11,x,y+14,7)
		line(x+w-16,y+h,x+w-1,y+h,4) line(x+w-28,y+h,x+w-22,y+h,4)
		line(x+w,y+h-12,x+w,y+h-1,4)

	end
	

	-- print age
	do
		local s,x,y="\^w\^t"..age.current,63-6,y-20
		print(s,x+1,y,0)
		print(s,x-1,y,0)
		print(s,x,y+1,0)
		print(s,x,y-1,0)
		print(s,x+2,y+2,0)
		print(s,x,y,11)
	end
	
	-- handle
	do
		handle.x+=(handle.tx-handle.x)*.25
		if (abs(handle.tx-handle.x)<.5) handle.x=handle.tx
		-- if (abs(handle.tx-handle.x)<.5) handle.x=handle.tx
		
		--[[ local hx,hy,hh=handle.x,y-2,h+10
		fillp(0b1010010110100101.1) rectfill(hx+2,hy+1,hx+4,hy+h+1,0) fillp()
		rectfill(hx-1,hy-4,hx+2,hy+hh,0)
		rectfill(hx,hy-3,hx+1,hy+hh-1,11)
		line(hx,hy-2,hx,hy+hh-1,10)
		pset(hx,hy-3,7)
		pset(hx+1,hy-3,10)
		palt(0b0000000000000001)
		sspr(0,0,23,16,hx-10,hy+hh)
		if handle.tx<handle.tx_def then
			sspr(34,0,4,5,handle.x-7,hy+hh+5)
		elseif handle.tx>handle.tx_def then
			sspr(34,0,4,5,handle.x+5,hy+hh+5,4,5,true)
		end
		palt() ]]
		local hx,hy,hh=handle.x,y-2,h+10
		handle.hitbox={hx-12,hy+hh-2,hx+13,hy+hh+16} -- update hitbox pos
		
		-- bottom button part
		palt(0b0000000000000001)
		sspr9(handle.drag and 20 or 9,16,11,11,hx-11,hy+hh,25,16,true)
		sspr(8,3,6,9,hx-2,hy+hh+3,6,9)
		?"<",hx-7,hy+hh+5,handle.tx<handle.tx_def and 7 or 0
		?">",hx+6,hy+hh+5,handle.tx>handle.tx_def and 7 or 0
		--[[ if handle.tx<handle.tx_def then
			sspr(34,0,4,5,handle.x-7,hy+hh+5)
		elseif handle.tx>handle.tx_def then
			sspr(34,0,4,5,handle.x+5,hy+hh+5,4,5,true)
		end ]]
		palt()
		
		-- outline
		if handle.hover then
			local y_=hy+hh-1
			palt(0b0000000000000001) sspr9(0,16,9,9,hx-12,y_,26,17) palt()
		end

		-- line part
		fillp(0b1010010110100101.1) rectfill(hx+2,hy+4,hx+4,hy+h+1,0) fillp()
		rect(hx-1,hy-4,hx+2,hy+hh,0)
		line(hx+1,hy-2,hx+1,hy+hh+1,11)
		line(hx,hy-2,hx,hy+hh+1,10)
		pset(hx,hy-3,7)
		pset(hx+1,hy-3,10)
	end

	-- side buttons
	--[[ do
		palt(0b0000000000000001)
		sspr9(0,32,15,17,x-4,y+h+8,21,18,true)
		palt()
	end ]]

	-- hand cursor
	do
		hand.x+=(m.x-hand.x)*.3
		hand.y+=(m.y-hand.y)*.3
		palt(0b0000000000000001)
		sspr(104-(m.lb==1 and 16 or 0),0,15,7,hand.x-5,hand.y-2) -- part a (normal-click)
		sspr(104,7,21,19,hand.x-5,hand.y-2+7) -- part b
		-- pset(m.x,m.y,rnd()*10) -- x,y check
		
		-- with arm (line style)
		--[[ for i=0,13 do
			local c=(i==0 or i>11) and 0 or (i==1 or i>9) and 2 or 7
			local x1,y1,x2,y2=m.x+i-2,m.y+17,m.x+i-3+(128-m.y)*0.1,128
			line(x1,y1,x2,y2,c)
			if (i>7 and i<10) fillp(0b0101101001011010.1) line(x1,y1,x2,y2,2) fillp()
			if (i==13) line(x1,y1,x2+1,y2,0) line(x1,y1,x2+2,y2,0)
		end ]]
		-- with arm (s style)
		local x1,y1
		for i=0,109-hand.y do
			x1=hand.x-5+i*(150-hand.x)*.002+cos(i/40-t()*3)*i/40
			y1=hand.y+19+i
			sspr(104,27+(i%2<1 and 0 or 1),18,1,x1,y1)
			fillp(0b1010010110100101.1) line(x1+17,y1,x1+17+i*.06,y1,0) fillp()
		end
		palt()
	end

	


	-- test	print
	-- printa((stat(30)==true and "t" or "f")..","..stat(32)..","..stat(33)..","..stat(34)..","..stat(31),2,10,7,0,true)
	--[[ if handle.drag then
		if m.lb!=1 then handle.drag=false
		else
			local dx=m.x-handle.dragfrom.x
			local dy=m.y-handle.dragfrom.y
			print("drag!:"..dx..","..dy,10,10,0)
		end
	end ]]
	-- print("mouse:"..mx..","..my..","..clk,1,1,0)
	--[[ print("ratio:"..age.ratio,1,1,0)
	print("ratio.to:"..age.ratio,1,7,0)
	print("age.to:"..age.to,1,7+6,0)
	print("age.before:"..age.before,1,7+12,0)
	print("age.current:"..age.current,1,7+18,0) ]]

end

