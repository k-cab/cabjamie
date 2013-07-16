// Generated by CoffeeScript 1.6.2
(function() {
  var that;

  that = this;

  this.appModule.factory('stubDataSvc', function($log, $http, $resource) {
    var obj;

    obj = {
      init: function() {},
      fetchPage: function(params) {
        var deferred, result;

        deferred = Q.defer();
        result = $resource('http://localhost\\:8081/mackerel/page').get(params, function() {
          var page;

          page = new Page(result);
          return deferred.resolve(page);
        });
        return deferred.promise;
      },
      savePage: function(page) {
        var deferred;

        deferred = Q.defer();
        $resource('http://localhost\\:8081/mackerel/page').save(pageData, function() {
          return deferred.resolve(page);
        });
        return deferred.promise;
      },
      fetchStickers: function(page) {
        var deferred, results;

        deferred = Q.defer();
        results = $resource('http://localhost\\:8081/mackerel/stickers').query(function() {
          results = results.map(function(e) {
            return new that.Sticker(e);
          });
          return deferred.resolve(results);
        });
        return deferred.promise;
      },
      createSticker: function(sticker) {
        var deferred;

        deferred = Q.defer();
        $resource('http://localhost\\:8081/mackerel/stickers').save(sticker, function(stickerData) {
          sticker.id = stickerData.guid;
          return deferred.resolve(sticker);
        });
        return deferred.promise;
      },
      updateSticker: function(sticker) {
        var deferred;

        deferred = Q.defer();
        $resource('http://localhost\\:8081/mackerel/stickers').save(sticker, function(stickerData) {
          return deferred.resolve(sticker);
        });
        return deferred.promise;
      },
      deleteSticker: function(sticker) {
        sticker.name = "archived - " + sticker.name;
        return Q.fcall(function() {
          return obj.updateSticker(sticker);
        });
      },
      persist: function(type, modelObj, resultHandler) {
        return Q.fcall(function() {
          $log.error("stub persist called");
          return null;
        });
      },
      fetchItems: function(params, resultHandler) {
        return Q.fcall(function() {
          $log.error("stub fetchItems called");
          return null;
        });
      }
    };
    return obj;
  });

}).call(this);
