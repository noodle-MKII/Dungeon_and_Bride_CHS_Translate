[s]
*start
@eval exp='tf.i = 0'
*loop
@clip left=&'(tf.i % 10) * 800' top=&'(tf.i \ 10) * 600'
@wait time=40
@eval exp='tf.i ++'
@eval exp='dm(tf.i + " のアニメーション")'
@s cond='tf.i == 40'
@home
@jump target=*loop
