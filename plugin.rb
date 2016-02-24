#!/bin/env ruby
# encoding: utf-8
# name: pseuCo.com Onebox
# version: 0.1
# authors: fefrei


register_css <<CSS
.pseuco-box {
  width: 690px;
  height: 500px;
}
CSS


Onebox = Onebox
class Onebox::Engine::PseuCoOnebox
    include Onebox::Engine

    def self.priority
        0
    end

    REGEX = /^https?:\/\/pseuco\.com\/\#\/edit\/remote\/([0-9a-z\-]+)$/

    matches_regexp REGEX

    def id
        @url.match(REGEX)[1]
    end

    def url
        "https://pseuco.com/#/edit/remote/#{id}"
    end

    def to_html
        <<HTML
        <iframe class="pseuco-box" src="https://pseuco.com/embed#/edit/remote/#{id}"></iframe>
HTML
    end
end
