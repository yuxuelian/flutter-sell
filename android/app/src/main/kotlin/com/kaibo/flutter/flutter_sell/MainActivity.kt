package com.kaibo.flutter.flutter_sell

import android.graphics.Color
import android.os.Build
import android.os.Bundle
import android.view.View
import android.view.Window
import android.view.WindowManager

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity(): FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    window.immersive(true)
    GeneratedPluginRegistrant.registerWith(this)
  }

  /**
   * 设置沉浸式
   * isLight是否对状态栏颜色变黑
   */
  fun Window.immersive(isLight: Boolean) {
    when {
      Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP -> {
        //清除状态栏默认状态
        clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS or WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION)
        addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
        //SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN 布局设置为全屏布局
        //SYSTEM_UI_FLAG_LAYOUT_STABLE
        //SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
        decorView.systemUiVisibility = View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or
                View.SYSTEM_UI_FLAG_LAYOUT_STABLE or
                if (isLight && Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                  View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                } else {
                  0
                }
        statusBarColor = Color.TRANSPARENT
      }
      Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT -> {
        this.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
      }
      else -> {
        return
      }
    }
  }
}
