#!/bin/bash
sips -Z 16  logo.png --out favicon.ico
sips -Z 32  logo.png --out favicon.png
sips -Z 72  logo.png --out assets/img/favicons/apple-icon-72x72.png
sips -Z 114 logo.png --out assets/img/favicons/apple-icon-114x114.png
sips -Z 144 logo.png --out assets/img/favicons/apple-icon-144x144.png
sips -Z 72  logo.png --out assets/img/favicons/apple-icon-precomposed.png
sips assets/img/favicons/logo.png
sips assets/img/logo.png
