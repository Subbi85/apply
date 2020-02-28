<?php
namespace schleyer\bloggy\controllers;

use craft\web\Controller;
use schleyer\bloggy\models\SettinsModel;
use schleyer\bloggy\Plugin;

/**
 * Class FeedbackController
 */

class FeedbackController extends Controller
{
    //Versenden der Feedback Nachricht
    public function actionSend(){
        $request = \Craft::$app->getRequest();

        //Informationen aus dem Formular holen

        $user = $request->getRequiredParam("user");
        $topic=$request->getRequiredParam("topic");
        $text = $request->getRequiredParam("message");

        $user = \Craft::$app->getUser()->getIdentity();
        $mailer = \Craft::$app->getMailer();

        /** @var SettinsModel $settings */
        $settings = Plugin::getInstance()->getSettings();

        $message = $mailer->compose();
        //Vorbereitung der Nachricht

        $prepared = $this->prepareMessage($user->name);
        var_dump($prepared);
        die;

        $success = $message->send();
        if ($success) {
            \Craft::$app->getSession()->setNotice("Nachricht erfolgreich verschickt");
        }else{
            \Craft::$app->getSession()->setNotice("Nachricht konnte nicht gesendet werden ");
        }
    }

    public function prepareMessage ($user){
        $userLong = "Hallo mein Name ist".$user;
        return $userLong;
    }
}