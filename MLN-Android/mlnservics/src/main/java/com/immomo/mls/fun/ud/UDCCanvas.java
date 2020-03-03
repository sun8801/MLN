/**
 * Created by MomoLuaNative.
 * Copyright (c) 2019, Momo Group. All rights reserved.
 *
 * This source code is licensed under the MIT.
 * For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.
 */
package com.immomo.mls.fun.ud;

import android.graphics.Canvas;

import androidx.annotation.NonNull;

import com.immomo.mls.util.DimenUtil;

import org.luaj.vm2.Globals;
import org.luaj.vm2.LuaUserdata;
import org.luaj.vm2.LuaValue;
import org.luaj.vm2.utils.LuaApiUsed;

/**
 * Created by MLN Template
 *
 */
@LuaApiUsed
public class UDCCanvas extends LuaUserdata<Canvas> {
    //<editor-fold desc="native method">
    /**
     * 初始化方法
     */
    public static native void _init();

    /**
     * 注册到虚拟机方法
     * @param l 虚拟机C层地址
     * @see Globals#getL_State()
     */
    public static native void _register(long l);
    //</editor-fold>

    //<editor-fold desc="Constructors">

    /**
     * 提供给Lua的构造函数
     * 必须存在
     *
     * @param L 虚拟机底层地址
     * @param v 初始化参数，非空，但长度可能为0
     */
    @LuaApiUsed
    protected UDCCanvas(long L, @NonNull LuaValue[] v) {
        super(L, v);
        /// 必须完成包裹对象的初始化
//        javaUserdata = new Canvas();
    }

    /**
     * 提供给Java的构造函数
     *
     * @param g 虚拟机
     * @param o 初始化对象
     */
    @LuaApiUsed
    public UDCCanvas(@NonNull Globals g, Canvas o) {
        super(g, o);
    }
    //</editor-fold>

    public void resetCanvas(Canvas javaUserdata) {
        this.javaUserdata = javaUserdata;
    }
    //<editor-fold desc="Bridge API">
    @LuaApiUsed
    protected int save() {
        return javaUserdata != null ? javaUserdata.save() : -1;
    }

    @LuaApiUsed
    protected void restore() {
        if (javaUserdata != null)
            javaUserdata.restore();
    }

    @LuaApiUsed
    protected void restoreToCount(int c) {
        if (javaUserdata != null)
            javaUserdata.restoreToCount(c);
    }

    @LuaApiUsed
    protected void translate(double x, double y) {
        if (javaUserdata == null)
            return;
        float dx = DimenUtil.dpiToPx(x);
        float dy = DimenUtil.dpiToPx(y);
        javaUserdata.translate(dx, dy);
    }

    @LuaApiUsed
    protected void clipRect(double l, double t, double r, double b) {
        if (javaUserdata == null)
            return;
        javaUserdata.clipRect(
                DimenUtil.dpiToPx(l),
                DimenUtil.dpiToPx(t),
                DimenUtil.dpiToPx(r),
                DimenUtil.dpiToPx(b));
    }

    @LuaApiUsed
    protected void clipPath(UDPath ud) {
        if (javaUserdata == null)
            return;
        javaUserdata.clipPath(ud.getJavaUserdata());
    }

    @LuaApiUsed
    protected void drawColor(int c) {
        if (javaUserdata == null)
            return;
        javaUserdata.drawColor(c);
    }

    @LuaApiUsed
    protected void drawRect(double l, double t, double r, double b, UDPaint p) {
        if (javaUserdata == null)
            return;
        javaUserdata.drawRect(
                DimenUtil.dpiToPx(l),
                DimenUtil.dpiToPx(t),
                DimenUtil.dpiToPx(r),
                DimenUtil.dpiToPx(b),
                p.getJavaUserdata()
        );
    }
    //</editor-fold>
}
