streamer_name: Jerry The Racecar Driver
twitch_name: jerryracer
streamer_url: http://jerry.race
streamer_logo: jerry.png
banner: jerry-banner.png
streamer_blurb: Jerry was a racecar driver.
layout: post
title: Jerry
tags: streamer
---

## Set frontmatter defaults

![banner]({{ page.banner }})

{{% if page.streamer_logo %}}
![logo]({{ page.streamer_logo }})
{{% endif %}}

{{ page.streamer_blurb }}

{{% if page.twitch_name %}}
Follow {{ page.streamer_name }} on [Twitch](https://twitch.tv/{{ page.twitch_name }})
{{% endif %}}
