/*     *    Copyright 2008 Anssi Piirainen * *    This file is part of Flowplayer. * *    Flowplayer is free software: you can redistribute it and/or modify *    it under the terms of the GNU General Public License as published by *    the Free Software Foundation, either version 3 of the License, or *    (at your option) any later version. * *    Flowplayer is distributed in the hope that it will be useful, *    but WITHOUT ANY WARRANTY; without even the implied warranty of *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the *    GNU General Public License for more details. * *    You should have received a copy of the GNU General Public License *    along with Flowplayer.  If not, see <http://www.gnu.org/licenses/>. */package org.flowplayer.model {
	import org.flowplayer.config.Config;	
	
	import flash.display.DisplayObject;
	
	import org.flowplayer.util.PropertyBinder;		
	/**	 * @author api	 */	public class Loadable {				private var _name:String;		private var _url:String;		private var _config:Object;		private var _plugin:PluginModel;		private var _playerConfig:Config;		
		public function Loadable(name:String, playerConfig:Config, url:String = null) {			_name = name;			_playerConfig = playerConfig;			_url = url;		}				public function createDisplayPlugin(disp:DisplayObject):DisplayPluginModel {			if (!_plugin) {				_plugin = _playerConfig.getPlugin(disp, _name, _config);			}			return _plugin as DisplayPluginModel;		}		public function createProvider(provider:Object):ProviderModel {			if (!_plugin) {				_plugin = (new PropertyBinder(new ProviderModel(provider, _name), "config")).copyProperties(_config) as PluginModel;			}			return _plugin as ProviderModel;		}		public function createPlugin(plugin:Object):PluginModel {			if (!_plugin) {				_plugin = (new PropertyBinder(new PluginModelImpl(plugin, _name), "config")).copyProperties(_config) as PluginModel;			}			return _plugin as PluginModel;		}		public function get url():String {			return _url;
		}
		
		public function set url(url:String):void {			_url = url;
		}				public function get config():Object {			return _config;		}				public function set config(config:Object):void {			_config = config;		}
		
		public function get name():String {			return _name;
		}				public function toString():String {			return "[Loadable] '" + _name + "'";		}
		
		public function get plugin():PluginModel {			return _plugin;
		}
	}}