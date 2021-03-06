package org.bigbluebutton.core
{
  import mx.collections.ArrayCollection;
  
  import org.bigbluebutton.common.LogUtil;
  import org.bigbluebutton.core.managers.UserManager;
  import org.bigbluebutton.core.vo.CameraSettingsVO;
  import org.bigbluebutton.main.model.users.BBBUser;

  public class UsersUtil
  {
    
    public static function amIPublishing():CameraSettingsVO {
     return UserManager.getInstance().getConference().amIPublishing();
    }
    
    public static function setIAmPublishing(publishing:Boolean):void {
      UserManager.getInstance().getConference().setCamPublishing(publishing);
    }
    
    public static function setCameraSettings(camSettings:CameraSettingsVO):void {
      UserManager.getInstance().getConference().setCameraSettings(camSettings);
    }
    
    public static function hasWebcamStream(userID:String):Boolean {
      var u:BBBUser = getUser(userID);
      if (u != null) {
        return u.hasStream;
      }
      
      return false;
    }
    
    public static function getWebcamStream(userID:String):String {
      var u:BBBUser = getUser(userID);
      if (u != null) {
        return u.streamName;
      }
      
      return null;
    }
    
    public static function getUserIDs():ArrayCollection {
      return UserManager.getInstance().getConference().getUserIDs();
    }
    
    public static function getInternalMeetingID():String {
      return UserManager.getInstance().getConference().internalMeetingID;
    }
    
    public static function getAvatarURL():String {
      return UserManager.getInstance().getConference().avatarURL;
    }
    
    public static function getExternalMeetingID():String {
      return UserManager.getInstance().getConference().externalMeetingID;
    }
    
    public static function amIModerator():Boolean {
      return UserManager.getInstance().getConference().amIModerator();
    }
    
    public static function amIPresenter():Boolean {
      return UserManager.getInstance().getConference().amIPresenter();
    }
    
    public static function getVoiceUser(voiceUserID:Number):BBBUser {
      return UserManager.getInstance().getConference().getVoiceUser(voiceUserID);
    }
    
    public static function hasUser(userID:String):Boolean {
      return UserManager.getInstance().getConference().hasUser(userID);
    }
    
    public static function getUser(userID:String):BBBUser {
      return UserManager.getInstance().getConference().getUser(userID);
    }
    
    public static function isMe(userID:String):Boolean {
      return UserManager.getInstance().getConference().amIThisUser(userID);
    }
    
    public static function getMyUserID():String {
      return UserManager.getInstance().getConference().getMyUserId();
    }
    
    public static function getMyUsername():String {
      return UserManager.getInstance().getConference().getMyName();
    }
    
    public static function internalUserIDToExternalUserID(userID:String):String {
      var user:BBBUser = UserManager.getInstance().getConference().getUser(userID);
      if (user != null) {
        LogUtil.debug("Found externUserID [" + user.externUserID + "] for userID [" + userID + "]");
        return user.externUserID;
      }
      LogUtil.warn("Could not find externUserID for userID [" + userID + "]");
      return null;
    }
    
    public static function externalUserIDToInternalUserID(externUserID:String):String {
      var user:BBBUser = UserManager.getInstance().getConference().getUserWithExternUserID(externUserID);
      if (user != null) {
        LogUtil.debug("Found userID [" + user.userID + "] for externUserID [" + externUserID + "]");
        return user.userID;
      }
      LogUtil.warn("Could not find userID for externUserID [" + externUserID + "]");
      return null;
    }    
    
    public static function getUserName(userID:String):String {
      var user:BBBUser = UserManager.getInstance().getConference().getUser(userID);
      if (user != null) {
        return user.name;
      }
      return null;
    }
    
  }
}