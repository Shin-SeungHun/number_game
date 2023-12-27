package com.ssh.number_game

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

import android.content.Intent
import android.os.Handler
import android.view.animation.Animation
import android.view.animation.AnimationUtils
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView

class IntroActivity : AppCompatActivity() {
    private lateinit var bgLogo: ImageView
    private lateinit var textView: TextView
    private lateinit var textView1: TextView
    private lateinit var textView2: TextView
    private lateinit var textView3: TextView
    private lateinit var textView4: TextView
    private lateinit var cl: LinearLayout

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_intro)

        initView()
    }

    private fun initView() {
        val handler = Handler()

        bgLogo = findViewById(R.id.bgLogo)
        textView = findViewById(R.id.textView)
        textView1 = findViewById(R.id.textView1)
        textView2 = findViewById(R.id.textView2)
        textView3 = findViewById(R.id.textView3)
        textView4 = findViewById(R.id.textView4)
        cl = findViewById(R.id.cl)

        val anim: Animation = AnimationUtils.loadAnimation(this, R.anim.scale)
        val anim1: Animation = AnimationUtils.loadAnimation(this, R.anim.set1)
        val anim2: Animation = AnimationUtils.loadAnimation(this, R.anim.set2)
        val anim3: Animation = AnimationUtils.loadAnimation(this, R.anim.set3)
        val anim4: Animation = AnimationUtils.loadAnimation(this, R.anim.set4)
        val anim5: Animation = AnimationUtils.loadAnimation(this, R.anim.set5)

        bgLogo.startAnimation(anim)
        textView.startAnimation(anim1)
        textView1.startAnimation(anim2)
        textView2.startAnimation(anim3)
        textView3.startAnimation(anim4)
        textView4.startAnimation(anim5)

        handler.postDelayed({
            val intent = Intent(applicationContext, MainActivity::class.java)
            startActivity(intent)
            finish()
        }, 3000) // 3초 뒤 Runner 객체 실행
    }

    override fun onPause() {
        super.onPause()
        finish()
    }
}