<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

a{
	text-decoration: none;
}
a:hover{
	text-decoration: none;
}
::-webkit-scrollbar {
display:none;
}
</style>
</head>
<body>
	<center>
		<div>
			<a href="https://www.instagram.com/kun_a_/" target="_blank">
				<img style="height:45px;width:45px"
				src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAgVBMVEX///8GBwkAAABPUFEDBwipqqvMzc38/PwICQsAAAMDBAZyc3PCwsK1tbXf39+Jiovy8vKen6DX2NljZGXr6+ukpKSXl5l5eXklJSeurq5paWlAQUI7Oz1dXl7u7/GTlZSChIM1NTUaGx0VFRdSUlLJyskfHx9JSUlSUlRAQEB9foBiYV/HAAANSklEQVR4nO1dDXeiPBPVVA0iUECqrRb8arVv//8PfJNYW2UmX0CE9eHu2XP2nJUkl4TJzOQmGQx69OjRo0ePHj16PDYo/0tdV0J/aro/fmulWRZFaRqEYZJsttvt9+yM/Mkc+c8zS/b8JknCMEjTKMoyCmq7K+I0SJb5aXc8EDc4HHenfJkEaXxXXue3mY5nx7+m+P6wefj+XwXH2Ti9I78oyUW1Uxe8UK5TUV+eRIM7jNd0s+addiduNzxZveuN466Mx++smtGoBX4coxGr/X3s5qvkRjtattR71+A9uYycDNZ0xb68lumdwb7KVfODNVudu6/tLjy3gHXkKmuOHB+gi/aH5y0Yx0VDHhVlfyavHePH4ZPXiWhdAww3rAO9tgkBeKwbN00wHGQfHezAM3zyUfNrpGycp4S0TUQBQlLRyuoMB0GnCXKKQR17QwcvhHTvC7yGR8hL1W+Rd/6L+RzPv9XLy7j16kYq3P7y0uyhxcQ75RQrdaMgaFSHN7yKcxqEPzQbP4JiFYaCoKaO31h1v1uv83zOwvRnhmR8hXAiR3j9w4Q/ykqY5/l6vdv/xtW69zusOlADNkTlBD3Rb4d8uwjTLCuKuNGMDaVxUWRZGi62uWCqmJA9NlCDCjUopwnB7rQI7pNdiIPFiSjDmvOkYVlsJifI+O1nd2J3QRzM9nKOzKJaTv3MNn1IpwlCvsLi76cNUwFN+f1XEX7J3zr5sLOndLCRleUkNjMFj1Fl7drYvewJNiB8zi+PXDXfCFHOOWKNIxOrgl7xV0X2YVvJ2TNY3eFe0rZXm4IWoAuFm0HmBa+jPYqi8mJOrh2ov05cmBeUgenH87h79Oyu7VZ45s6kV26ib2xP6WCFjANmkEOnzbZBiAYEZGU6vFLMzNQMU5qELKjziamVx7qwimPkEgEW9bBONEIEutBnr6c7Q/SMkLUStJOYTWVLpAuZkenGCL2AMnODNHNp8myM9D+ZtzsNQrDWzCHFKTHxlsfwQbIv9M+5RJEha93FAWnpWFsWHbwTML7b+wgZqcm3WIr1tsArC8oM/SF51481ZKogeXtDdMIjw5Ev1oPXZY5foBNNJgwkqDC0UI3jvF5y1Y6yUxUhbdWHGGvwlLmr0Di2t4kUn8yu/xdzvshJV2ZEygu8ouPboVgeT7533YsU+6RG2gGXAIbkyykLBSKg8fDLUeBX2T8dkURTag77vR1DSjFDwlqzvhlPIehEZhbVgE/s75tyuoDieYbhbSfGIBz2ibrcFLMzLWGLxvJke/MjxNao5wvo0LQXU5xwht7Nj8Csr3Zr6GAGO72dQcoG4BFl6JMbux7Dz2qmtPygVP384goZnv8t5yr+B1p8lJdJkbjCJr3TLKQMb6OARZkhjy/knQhn0IY/wyJmf0x+SBEzKTAq2UrofitNDfLdNvMZ0s+35/x9f5hyHPbv+fPbp9JPYv/5hFua0iCM7WxjAgb1oT677G35J0VlBH//fVy+yfN/eBDPWvRd+iGIEhVeDYUJDK2HoChMIN2cpIucYonuIqeEPQrnZvFQOYQCXhhZSr9Divx6W9nrZo/FLzotqgj7XmK8EmyYlmw7RRwDZTgLJtk6pjTjYk3tUrzHu3KJjlYk/JtCMwKMqWqCozvw68pud7QylklzkfMKC3qSUv/7/I2X+ycEbd7JuxC4EZ5xFvkPYqWy+LYTM7LR+l0MSqoRYGz8klMqkJYDKHKU2//MA+/DXjfG2zj2rLVwPvHGg9vvkdFNrowUV+phjQZt9uSNBtlu8+Wcm2LeCc/X2YipPD4CyXtpqDKK0ZOYY4Q04gsVPwPfR5X5BgyJVyFROq4shSNYXJA+P7Hp9HiC2cQfhuWBp2IIZiDrVDAd0HkNNfiUzDHFaJxl8k+rAN6dwnhAhjs7p42NKsn6uCnIaySbzSRrezGcAOQMgVtK1pbTPV/Xq6En9nyxTgnemwoU5D8VjimcWmwYsnf81oAalZA3q6VYhKF8EocMbdzSZgj+ULSoF7qacobl0MKzc7zfmhG8ez6jaMWwPOXLgwsYPM2N66GCoIYhJpuFDAVF814E64gKhmBV5nadQE2QGRkFQf9XinoRjcqdHs8TsgjTqkH2DHV9zoCBiDFD5i0ovkGxADhPws80o0U6CZO5p5bGEov1Lshw64Ihlc+DzOM6zMOy+5eF84PCOyevNfrQhqGRCorii+q/3fEU4n5DHD4p5JRz021NINuhYPhdkaHIlePdQchcFYClcwlHX+SuKzIsp3L+APvbkGEkkYQjK9NlTNYoRy7elvpvOobyb6siwwFXN+AdqJdGyGMR8m5W+TOIiGwYmqVpEIHKkFuYk5lBjE64xTF6P9gsbsPQqI4CpAaGwjNZmn1IlMuwMG/IMDoF77d5hsBAiUeZZ2Fq8G+zFVdlyE3G/RhSbLm9ghoVU4z6vpGxcd2HuN6WaxntNgfAFfmhdi3QniGMQwxGaYbswPL5ELViSEFy9DxjGGTCIEN5RATS6CYMUbGmkQqyoYIgwyfpb6swRMWapwqLHRRbuDeRU7pm+IIo/Uy9kRtQLDzxyYv2QdcMoQ6OP1VtwyMmbV1rn3PMEFnkM2iUDNjr0q6cOGa4gdOY5Qaka0wAQ08RsP/AMUNoHSxyOxAwzNTLXeowHGkZQkmI+bYODFAMol8ceivLKa0Y6rQmb/Cdy4s3AVzZ1qYWJ7UY6j4pOEvXFGuCpLR+0nfLEKrEDvUEODEUjyhUXAJOGdJm7QwHYms0k6tThsC6198fhah+tY1wyBAxNHWPbwLL8lpT45QhTHN56gcMANUSmnSYU4YwoKz7GWILLZoFMKcMQRZRuxdAD5g602QVnTKEIoH6WxfgMu1e/YBThuXJa0Q+K3C6xSdosEYB6pJhPAUP1D9RIgUNnqqdCLcMp+UH6p/1l5UbPG2RYQEZNnAEHmSoTn33fXiN/jsEeHhb+h+YDx/fp3l8v/TxY4vHjw8/7xLja+xzn6e5Rp9rg/j386WPn/N+9HWLx1976tcPB/+FNWC0UXp1AYaOruPLtBj26KwWA9fTVEjXdFZP829poirq2qACurO6tmr6UvDUsEltoh6u9aXUtb5U+6La1Aibo8MaYQ6pzttYBd2izvvxtfqPv9/i0fbMPP6+p8ffu1Zj/2Gs3n+4st9/aJzRutMOS9V9GEOxh3Q6T8IgzWiWBiZ7SM0zyzYMHe4DBpfttLMPuM5e7kHDe7nNYbOX+/H34z/+mQqPfy5GR882sWYoL6H2+TRs0nB3Po0EVufTNHHGUOzgjCElrM4YQs6JqrCk2/A5UTpYnRNVZugZZYJgMU2d9WXGkExva1IxzErLk36V08yaO6/NlGEpTaQaeBlc0q1x5p7N5zjFztwzAzQeijP3wLmJXo1zE2dW5ybOKt9OEAKXRnFuYsfOvjSDzdmXjZ5fyp+yOL+0ei0255d27AxaQ9icQXuPc4SvoTxH2Bg25wi7PAt6cjkL2r+cBT1p5s4My7Og3Z/nzdFoiVbneXfrTHZDWJ7Jjqi4DBPPrQGKeFUqsU7djWAG67sRunS/hRECyFAdn3TpjhIjWN9Rgt0z0/Kda0rY3zPTnbuCzICINXVeWJfuezIAuDBJf99Tp+7sUqPinV3dundNDfTeNb0OrkN352mB352nQ8fuP1QACWdNFModu8NSCWBIze6w7OQ9pChgKthQoEKRtAOfZLo1UHHpgG+2S/fh7wPGLNQ/cqezsdVHjnr0rBe9HKPWvdyPf7c6fl6ntWLUJTA1qpXzlQHJARdZgOt4W8MzH6Jl3YdntYy0QDTXvIi84G+pvbEqKi/monVQW26VNJOsVZN92O7EyOoO8VsDh+TVqiT8Hlc+UvN23fAo5zYGaVz5pmANKBZiXDiu6p8MURXpSrqCbnAh9zUopR8KOeVX+Oenuh6zf+UX4ZdCrPlht7pKhdZQtvTnE7JfBffNo8bBai9fqPNstIy/SHVyyvfFfVjSOFi868SaaRV3JJCIt/96kpBDvl2EaZZlRdyow0NpXLBS03CxzQ9EvczKJeGVXEo6eCFw1kH6Ulyxst+t13mez1azZ4bF+BrBRIbg5ncL/uhsNpvn+Xq923u/UlQlPLHhsdLBxWeKenhCauAAU0NNDidYjSGnaCQZuQwhSXtGcsje2W25SkwFwcqXpb7ILWo3wIZytSF66UY8TOkQagZ1vPOVk0brOE8TNa149mGtUbsXfPLRgJiD9eSGNCNRbxYev3nVWo2KMxxMXjvYjT55nQwaYSiG+cLuel/3YB24MN0YZYbsJ25pnydvAeO3auQLvAGPzdrnxzF1E6PyS4GWahf4LuAO/xK9+rgZmmMexug2LjnDaMSDtrHjmC3d6DSjriC0qBvnKRQ+OKJkfvH978TtHLvkSTS4X6ovHc+uRKPwUIUmeF1tWTzOxm3kv+I0SJb5aXf0iBt4x90pXyZB2o627ne00DiLojQNwjBJNtvt9nt2Rv5kjvznmW/2/CZJwjBI0yjKYgpquztH58tRooJurHn16NGjR48ePXr0cIf/A8Zx3SCXALVrAAAAAElFTkSuQmCC">
				<img style="height:45px;width:140px"
				src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/2000px-Instagram_logo.svg.png">
			</a>
		</div>
		<br>
		<div style="min-height:680px;overflow:scroll;-ms-overflow-style: none;">
			<div id="instafeed" style="height:200px;"></div>
		</div>
	</center>
	<script>
	(function() {
		  var Instafeed;

		  Instafeed = (function() {
		    function Instafeed(params, context) {
		      var option, value;
		      this.options = {
		        target: 'instafeed',
		        get: 'popular',
		        resolution: 'thumbnail',
		        sortBy: 'none',
		        links: true,
		        mock: false,
		        useHttp: false
		      };
		      if (typeof params === 'object') {
		        for (option in params) {
		          value = params[option];
		          this.options[option] = value;
		        }
		      }
		      this.context = context != null ? context : this;
		      this.unique = this._genKey();
		    }

		    Instafeed.prototype.hasNext = function() {
		      return typeof this.context.nextUrl === 'string' && this.context.nextUrl.length > 0;
		    };

		    Instafeed.prototype.next = function() {
		      if (!this.hasNext()) {
		        return false;
		      }
		      return this.run(this.context.nextUrl);
		    };

		    Instafeed.prototype.run = function(url) {
		      var header, instanceName, script;
		      if (typeof this.options.clientId !== 'string') {
		        if (typeof this.options.accessToken !== 'string') {
		          throw new Error("Missing clientId or accessToken.");
		        }
		      }
		      if (typeof this.options.accessToken !== 'string') {
		        if (typeof this.options.clientId !== 'string') {
		          throw new Error("Missing clientId or accessToken.");
		        }
		      }
		      if ((this.options.before != null) && typeof this.options.before === 'function') {
		        this.options.before.call(this);
		      }
		      if (typeof document !== "undefined" && document !== null) {
		        script = document.createElement('script');
		        script.id = 'instafeed-fetcher';
		        script.src = url || this._buildUrl();
		        header = document.getElementsByTagName('head');
		        header[0].appendChild(script);
		        instanceName = "instafeedCache" + this.unique;
		        window[instanceName] = new Instafeed(this.options, this);
		        window[instanceName].unique = this.unique;
		      }
		      return true;
		    };

		    Instafeed.prototype.parse = function(response) {
		      var anchor, childNodeCount, childNodeIndex, childNodesArr, e, eMsg, fragment, header, htmlString, httpProtocol, i, image, imageObj, imageString, imageUrl, images, img, imgHeight, imgOrient, imgUrl, imgWidth, instanceName, j, k, len, len1, len2, node, parsedLimit, reverse, sortSettings, targetEl, tmpEl;
		      if (typeof response !== 'object') {
		        if ((this.options.error != null) && typeof this.options.error === 'function') {
		          this.options.error.call(this, 'Invalid JSON data');
		          return false;
		        } else {
		          throw new Error('Invalid JSON response');
		        }
		      }
		      if (response.meta.code !== 200) {
		        if ((this.options.error != null) && typeof this.options.error === 'function') {
		          this.options.error.call(this, response.meta.error_message);
		          return false;
		        } else {
		          throw new Error("Error from Instagram: " + response.meta.error_message);
		        }
		      }
		      if (response.data.length === 0) {
		        if ((this.options.error != null) && typeof this.options.error === 'function') {
		          this.options.error.call(this, 'No images were returned from Instagram');
		          return false;
		        } else {
		          throw new Error('No images were returned from Instagram');
		        }
		      }
		      if ((this.options.success != null) && typeof this.options.success === 'function') {
		        this.options.success.call(this, response);
		      }
		      this.context.nextUrl = '';
		      if (response.pagination != null) {
		        this.context.nextUrl = response.pagination.next_url;
		      }
		      if (this.options.sortBy !== 'none') {
		        if (this.options.sortBy === 'random') {
		          sortSettings = ['', 'random'];
		        } else {
		          sortSettings = this.options.sortBy.split('-');
		        }
		        reverse = sortSettings[0] === 'least' ? true : false;
		        switch (sortSettings[1]) {
		          case 'random':
		            response.data.sort(function() {
		              return 0.5 - Math.random();
		            });
		            break;
		          case 'recent':
		            response.data = this._sortBy(response.data, 'created_time', reverse);
		            break;
		          case 'liked':
		            response.data = this._sortBy(response.data, 'likes.count', reverse);
		            break;
		          case 'commented':
		            response.data = this._sortBy(response.data, 'comments.count', reverse);
		            break;
		          default:
		            throw new Error("Invalid option for sortBy: '" + this.options.sortBy + "'.");
		        }
		      }
		      if ((typeof document !== "undefined" && document !== null) && this.options.mock === false) {
		        images = response.data;
		        parsedLimit = parseInt(this.options.limit, 10);
		        if ((this.options.limit != null) && images.length > parsedLimit) {
		          images = images.slice(0, parsedLimit);
		        }
		        fragment = document.createDocumentFragment();
		        if ((this.options.filter != null) && typeof this.options.filter === 'function') {
		          images = this._filter(images, this.options.filter);
		        }
		        if ((this.options.template != null) && typeof this.options.template === 'string') {
		          htmlString = '';
		          imageString = '';
		          imgUrl = '';
		          tmpEl = document.createElement('div');
		          for (i = 0, len = images.length; i < len; i++) {
		            image = images[i];
		            imageObj = image.images[this.options.resolution];
		            if (typeof imageObj !== 'object') {
		              eMsg = "No image found for resolution: " + this.options.resolution + ".";
		              throw new Error(eMsg);
		            }
		            imgWidth = imageObj.width;
		            imgHeight = imageObj.height;
		            imgOrient = "square";
		            if (imgWidth > imgHeight) {
		              imgOrient = "landscape";
		            }
		            if (imgWidth < imgHeight) {
		              imgOrient = "portrait";
		            }
		            imageUrl = imageObj.url;
		            httpProtocol = window.location.protocol.indexOf("http") >= 0;
		            if (httpProtocol && !this.options.useHttp) {
		              imageUrl = imageUrl.replace(/https?:\/\//, '//');
		            }
		            imageString = this._makeTemplate(this.options.template, {
		              model: image,
		              id: image.id,
		              link: image.link,
		              type: image.type,
		              image: imageUrl,
		              width: imgWidth,
		              height: imgHeight,
		              orientation: imgOrient,
		              caption: this._getObjectProperty(image, 'caption.text'),
		              likes: image.likes.count,
		              comments: image.comments.count,
		              location: this._getObjectProperty(image, 'location.name')
		            });
		            htmlString += imageString;
		          }
		          tmpEl.innerHTML = htmlString;
		          childNodesArr = [];
		          childNodeIndex = 0;
		          childNodeCount = tmpEl.childNodes.length;
		          while (childNodeIndex < childNodeCount) {
		            childNodesArr.push(tmpEl.childNodes[childNodeIndex]);
		            childNodeIndex += 1;
		          }
		          for (j = 0, len1 = childNodesArr.length; j < len1; j++) {
		            node = childNodesArr[j];
		            fragment.appendChild(node);
		          }
		        } else {
		          for (k = 0, len2 = images.length; k < len2; k++) {
		            image = images[k];
		            img = document.createElement('img');
		            imageObj = image.images[this.options.resolution];
		            if (typeof imageObj !== 'object') {
		              eMsg = "No image found for resolution: " + this.options.resolution + ".";
		              throw new Error(eMsg);
		            }
		            imageUrl = imageObj.url;
		            httpProtocol = window.location.protocol.indexOf("http") >= 0;
		            if (httpProtocol && !this.options.useHttp) {
		              imageUrl = imageUrl.replace(/https?:\/\//, '//');
		            }
		            img.src = imageUrl;
		            if (this.options.links === true) {
		              anchor = document.createElement('a');
		              anchor.href = image.link;
		              anchor.appendChild(img);
		              fragment.appendChild(anchor);
		            } else {
		              fragment.appendChild(img);
		            }
		          }
		        }
		        targetEl = this.options.target;
		        if (typeof targetEl === 'string') {
		          targetEl = document.getElementById(targetEl);
		        }
		        if (targetEl == null) {
		          eMsg = "No element with id=\"" + this.options.target + "\" on page.";
		          throw new Error(eMsg);
		        }
		        targetEl.appendChild(fragment);
		        header = document.getElementsByTagName('head')[0];
		        header.removeChild(document.getElementById('instafeed-fetcher'));
		        instanceName = "instafeedCache" + this.unique;
		        window[instanceName] = void 0;
		        try {
		          delete window[instanceName];
		        } catch (_error) {
		          e = _error;
		        }
		      }
		      if ((this.options.after != null) && typeof this.options.after === 'function') {
		        this.options.after.call(this);
		      }
		      return true;
		    };

		    Instafeed.prototype._buildUrl = function() {
		      var base, endpoint, final;
		      base = "https://api.instagram.com/v1";
		      switch (this.options.get) {
		        case "popular":
		          endpoint = "media/popular";
		          break;
		        case "tagged":
		          if (!this.options.tagName) {
		            throw new Error("No tag name specified. Use the 'tagName' option.");
		          }
		          endpoint = "tags/" + this.options.tagName + "/media/recent";
		          break;
		        case "location":
		          if (!this.options.locationId) {
		            throw new Error("No location specified. Use the 'locationId' option.");
		          }
		          endpoint = "locations/" + this.options.locationId + "/media/recent";
		          break;
		        case "user":
		          if (!this.options.userId) {
		            throw new Error("No user specified. Use the 'userId' option.");
		          }
		          endpoint = "users/" + this.options.userId + "/media/recent";
		          break;
		        default:
		          throw new Error("Invalid option for get: '" + this.options.get + "'.");
		      }
		      final = base + "/" + endpoint;
		      if (this.options.accessToken != null) {
		        final += "?access_token=" + this.options.accessToken;
		      } else {
		        final += "?client_id=" + this.options.clientId;
		      }
		      if (this.options.limit != null) {
		        final += "&count=" + this.options.limit;
		      }
		      final += "&callback=instafeedCache" + this.unique + ".parse";
		      return final;
		    };

		    Instafeed.prototype._genKey = function() {
		      var S4;
		      S4 = function() {
		        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
		      };
		      return "" + (S4()) + (S4()) + (S4()) + (S4());
		    };

		    Instafeed.prototype._makeTemplate = function(template, data) {
		      var output, pattern, ref, varName, varValue;
		      pattern = /(?:\{{2})([\w\[\]\.]+)(?:\}{2})/;
		      output = template;
		      while (pattern.test(output)) {
		        varName = output.match(pattern)[1];
		        varValue = (ref = this._getObjectProperty(data, varName)) != null ? ref : '';
		        output = output.replace(pattern, function() {
		          return "" + varValue;
		        });
		      }
		      return output;
		    };

		    Instafeed.prototype._getObjectProperty = function(object, property) {
		      var piece, pieces;
		      property = property.replace(/\[(\w+)\]/g, '.$1');
		      pieces = property.split('.');
		      while (pieces.length) {
		        piece = pieces.shift();
		        if ((object != null) && piece in object) {
		          object = object[piece];
		        } else {
		          return null;
		        }
		      }
		      return object;
		    };

		    Instafeed.prototype._sortBy = function(data, property, reverse) {
		      var sorter;
		      sorter = function(a, b) {
		        var valueA, valueB;
		        valueA = this._getObjectProperty(a, property);
		        valueB = this._getObjectProperty(b, property);
		        if (reverse) {
		          if (valueA > valueB) {
		            return 1;
		          } else {
		            return -1;
		          }
		        }
		        if (valueA < valueB) {
		          return 1;
		        } else {
		          return -1;
		        }
		      };
		      data.sort(sorter.bind(this));
		      return data;
		    };

		    Instafeed.prototype._filter = function(images, filter) {
		      var filteredImages, fn, i, image, len;
		      filteredImages = [];
		      fn = function(image) {
		        if (filter(image)) {
		          return filteredImages.push(image);
		        }
		      };
		      for (i = 0, len = images.length; i < len; i++) {
		        image = images[i];
		        fn(image);
		      }
		      return filteredImages;
		    };

		    return Instafeed;

		  })();

		  (function(root, factory) {
		    if (typeof define === 'function' && define.amd) {
		      return define([], factory);
		    } else if (typeof module === 'object' && module.exports) {
		      return module.exports = factory();
		    } else {
		      return root.Instafeed = factory();
		    }
		  })(this, function() {
		    return Instafeed;
		  });

		}).call(this);
	
	</script>
	<script type="text/javascript">
		var userFeed = new Instafeed({
			get: 'user',
			userId:	1286979373,
			sortBy: "most-recent",
			limit:20,
			template: '<a href="{{link}}" target="_blank"><img src="{{image}}"/></a><br><br>',
			accessToken: '1286979373.c7cfed5.227f6d6b0cee4b5cb5cc0c94237e82ae'
		});
		userFeed.run();
	</script>
</body>
</html>