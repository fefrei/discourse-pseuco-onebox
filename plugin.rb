#!/bin/env ruby
# encoding: utf-8
# name: pseuCo.com Onebox
# version: 0.1
# authors: fefrei


register_css <<CSS
.reference {
    position: relative;
    height: 100%;
    width: 100%;
}

.pseuco-embed {
    position: relative;
    width: 690px;
    height: 400px;
    border: 1px solid #ddd;
    border-radius: 3px;
}

.pseuco-container {
    position: absolute;
    top: 33px;
    bottom: 0px;
    left: 0px;
    right: 1px;
}

.pseuco-header-bar {
    position: absolute;
    top: 0px;
    left: 0px;
    right: 0px;
    height: 32px;
    background: #F7F7F7;
    border-bottom: 1px solid #ddd;
}

.pseuco-header-textarea {
    position: absolute;
    left: 0px;
    top: 0px;
    bottom: 0px;
    width: 300px;
    padding: 6px 12px;
    line-height: 21px;
    font-family: Consolas, Menlo, Monaco, Lucida Console,'Bitstream Vera Sans Mono','Courier',monospace;
    color: #333;
    font-size: 12px;
}

.pseuco-header-button {
    position: absolute;
    top: 6px;
    bottom: 6px;
    right: 12px;
    background-color: #FFF;
    padding: 1px 5px;
    border: 1px solid #CCC;
    border-radius: 3px;
    color: #000 !important;
    text-decoration: none;
    font-size: 12px;
}

.pseuco-frame {
    border: none;
    width: 100%;
    height: 100%;
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
        <div class="pseuco-embed">
            <div class="pseuco-header-bar">
                <div class="reference">
                    <div class="pseuco-header-textarea">
                        <span>pseuCo.com File Sharing</span>
                    </div>
                    <a class="pseuco-header-button" role="button" href="https://pseuco.com/#/edit/remote/#{id}" target="_blank">Open in pseuCo.com <i class="fa fa-arrow-right pseuco-button-arrow"></i></a>
                </div>
            </div>
            <div class="pseuco-container">
                <iframe class="pseuco-frame" src="https://pseuco.com/embed#/edit/remote/#{id}"></iframe>
            </div>
        </div>
HTML
    end
end
