--[[
Age-Gauge Prototyping
]]

-- sspr + scale9
function sspr9(sx,sy,sw,sh,dx,dy,dw,dh)
	local cw,ch=flr(sw/2),flr(sh/2)
	sspr(sx,sy,cw,ch,dx,dy,cw,ch) -- lt
	sspr(sx+cw,sy,1,ch,dx+cw,dy,dw-cw*2,ch) -- ct
	sspr(sx+cw+1,sy,cw,ch,dx+dw-cw,dy,cw,ch) -- rt
	sspr(sx,sy+ch,cw,1,dx,dy+ch,cw,dh-ch*2) -- lc
	sspr(sx+cw+1,sy+ch,cw,1,dx+dw-cw,dy+ch,cw,dh-ch*2) -- rc
	sspr(sx,sy+ch+1,cw,ch,dx,dy+dh-ch,cw,ch) -- lb
	sspr(sx+cw,sy+ch+1,1,ch,dx+cw,dy+dh-ch,dw-cw*2,ch) -- cb
	sspr(sx+cw+1,sy+ch+1,cw,ch,dx+dw-cw,dy+dh-ch,cw,ch) -- rb
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
		ratio=0,
		ratio_spd=0,
		intv=0
	}

	handle={
		tx_def=63,
		tx=63,
		cx=63
	}
	

end

function _update60()

	-- if age_to>=age_min and age_to<=age_max then
	-- 	if (btn(0)) age_acc=max(-age_acc_max,age_acc-0.025)
	-- 	if (btn(1)) age_acc=min(age_acc_max,age_acc+0.025)
	-- end
	if age.intv>0 then
		age.intv-=1
	else
		if (btn(0)) then age.to=max(age.to-1,age.min) age.intv=3 handle.tx=handle.tx_def-5
		elseif (btn(1)) then age.to=min(age.to+1,age.max) age.intv=3 handle.tx=handle.tx_def+5
		else handle.tx=handle.tx_def end
	end

	age.current=mid(flr(age.to+0.5),age.min,age.max)
	if age.current!=age.before then
		sfx(11,-1)
		age.before=age.current
		
	end
end

function _draw()
	cls(5)

	-- local x,y,w,h=24,50,80,24 -- gauge pos, size
	local x,y,w,h=18,50,92,24 -- gauge pos, size

	rectfill(x,y,x+w,y+h,8) -- bg
	rectfill(x,y,x+5,y+h,13)	rectfill(x+w-5,y,x+w,y+h,13)
	fillp(0b0000101000001000.1) rectfill(x+6,y,x+10,y+h,13) rectfill(x+w-10,y,x+w-6,y+h,13) fillp()
	fillp(0b0101101001011010.1) rectfill(x+11,y,x+15,y+h,13) rectfill(x+w-15,y,x+w-11,y+h,13) fillp()
	fillp(0b1101111101111111.1) rectfill(x+16,y,x+20,y+h,13) rectfill(x+w-20,y,x+w-16,y+h,13) fillp()
	
	-- outline
	palt(0,false) palt(15,true)
	sspr9(23,0,11,11,x-4,y-4,w+9,h+9)
	
	-- inside top oval cover
	clip(x,y,w+1,10)
	for i=0,6 do
		-- oval(x-5,y+0-i,x+w+5,y+16-i,0)
		oval(x-8,y+0-i,x+w+8,y+26-i,0)
	end

	-- inside bottom oval over + gradations + glass eff
	clip(x,y,w+1,h+1)
	ovalfill(x+4,y+h-2,x+w-4,y+h+14,0)
	do
		local cx,w0,h0,gap=x+w/2-0.5,8,16,1
		local r_to=(age.to-age.min)/(age.max-age.min)
		age.ratio_spd=(r_to-age.ratio)*0.05+age.ratio_spd*0.65
		age.ratio+=age.ratio_spd

		for i=0,age.max-age.min do
			local x0=cx+i*(w0+gap) - age.ratio*(age.max-age.min)*(w0+gap)
			if x0>x-w0 and x0<x+w+w0 then
				local dy=(i<7) and (i-7)*2 or 0
				local oy=y-cos(abs(63-x0)*0.005)*8+10
				local dx=abs(cx-x0) -- dist from center
				rectfill(x0-3,oy+2-dy,x0+w0-4,oy+h0,dx>37 and 8 or dx>26 and 14 or 6)
				if (dx>12 and dx<26) fillp(0b0101101001011010.1) rectfill(x0-3,oy+2-dy,x0+w0-4,oy+h0,14) fillp()
			end
		end

		-- side shadow
		--[[ fillp(0b0100101000011010.1)
		rectfill(x,y,x+2,y+h+1,0)
		rectfill(x+w-2,y,x+w,y+h+1,0)
		fillp(0b0101101001011010.1)
		rectfill(x+3,y,x+6,y+h+1,0)
		rectfill(x+w-3,y,x+w-6,y+h+1,0)
		fillp(0b1101111101111111.1)
		rectfill(x+7,y,x+10,y+h+1,0)
		rectfill(x+w-7,y,x+w-10,y+h+1,0)
		fillp() ]]
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

	end
	clip()

	-- test	
	print("ratio:"..age.ratio,1,1,0)
	print("age.to:"..age.to,1,7,0)
	print("age.before:"..age.before,1,7+6,0)
	print("age.current:"..age.current,1,7+12,0)

	-- print age
	do
		local s,x,y="\^w\^t"..age.current,63-6,30
		print(s,x+1,y,0)
		print(s,x-1,y,0)
		print(s,x,y+1,0)
		print(s,x,y-1,0)
		print(s,x+2,y+2,0)
		print(s,x,y,11)
	end
	
	-- handle
	do
		handle.cx+=(handle.tx-handle.cx)*0.2
		local hx,hy,hh=handle.cx,y-2,h+8
		fillp(0b1010010110100101.1) rectfill(hx+2,hy+1,hx+4,hy+h+1,0) fillp()
		rectfill(hx-1,hy-4,hx+2,hy+hh,0)
		rectfill(hx,hy-3,hx+1,hy+hh-1,11)
		line(hx,hy-2,hx,hy+hh-1,10)
		pset(hx,hy-3,7)
		pset(hx+1,hy-3,10)
		palt(0,false) palt(15,true)
		sspr(0,0,23,16,hx-10,hy+hh)

		if handle.tx<handle.tx_def then
			sspr(34,0,4,5,handle.cx-7,hy+hh+5)
		elseif handle.tx>handle.tx_def then
			sspr(34,0,4,5,handle.cx+5,hy+hh+5,4,5,true)
		end
	end

	

end

