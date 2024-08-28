streamer_name:
twitch_name:
streamer_url:
streamer_logo:
banner:
streamer_blurb:
layout: post
title: {{ page.streamer_name }}
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
