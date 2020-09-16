# D R O P I C E

Thank you for the [wonderful idea][ce-tweet], [@ComradeEevee][ce].

[ce-tweet]: https://twitter.com/ComradeEevee/status/1306262129687826433
[ce]: https://twitter.com/ComradeEevee

This is a set of shell scripts using the `fish` shell to write DROP ICE, or ABOLISH ICE, on your
GitHub graph. **If someone wants to port this to bash, that'd be great and I would totally accept
that PR!**

Run the `dropice.sh` script and pass it the year, month, and day you want the
phrase to end. In the `DROP ICE` screenshot below, I ran it as:
`./dropice.sh 2020 08 30` because that's where the end of the E is.

Becuase it makes 100 commits every day, it will force all your other commit squares to go pale. If
you make a bunch of commits in a day, you can turn up the number of commits in the `datefill.sh`
file.

![dropice][dropice_image]

[dropice_image]: res/drop_ice.png

You can see `DROP ICE` in action on [my graph][graph]. The commits are in my [account repository][ar].

[graph]: https://github.com/genuinebyte
[ar]: https://github.com/genuinebyte/genuinebyte

If you'd rather `ABOLISH ICE` then run it as `./dropice.sh <year> <month> <day> abolish`.

![abolishice][abolishice_image]

[abolishice_image]: res/abolish_ice.png

When you start loosing the start of the first word because time moves, you can delete the repository
you pushed to github that has all the commits, and then make a new one with new dates!