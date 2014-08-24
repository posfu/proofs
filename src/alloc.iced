
web_service = require './web_service'
base = require './base'
{Untrack,Track} = require './track'
{Auth} = require './auth'
{Revoke} = require './revoke'
{Cryptocurrency} = require './cryptocurrency'
{Announcement} = require './announcement'
{Subkey} = require './subkey'

#=======================================================

lookup_tab = {
  "web_service_binding.twitter"    : web_service.TwitterBinding,
  "web_service_binding.github"     : web_service.GithubBinding,
  "web_service_binding.reddit"     : web_service.RedditBinding,
  "web_service_binding.keybase"    : web_service.KeybaseBinding,
  "web_service_binding.generic"    : web_service.GenericWebSiteBinding,
  "web_service_binding.dns"        : web_service.DnsBinding,
  "web_service_binding.coinbase"   : web_service.CoinbaseBinding,
  "web_service_binding.hackernews" : web_service.HackerNewsBinding,
  "generic_binding"                : base.GenericBinding,
  "track"                          : Track,
  "untrack"                        : Untrack,
  "auth"                           : Auth,
  "revoke"                         : Revoke,
  "cryptocurrency"                 : Cryptocurrency,
  "announcement"                   : Announcement,
  "subkey"                         : Subkey
}

#--------------------------------------------

get_klass = (type) ->
  err = klass = null
  unless (klass = lookup_tab[typ])?
    err = new Error "Unknown proof class: #{type}"
  [err, klass]

#=======================================================

alloc = (type, args) ->
  ret = null
  [err, klass] = get_klass type
  if klass?
    ret = new klass args
  ret

#=======================================================

exports.get_klass = get_klass
exports.alloc = alloc

#=======================================================

