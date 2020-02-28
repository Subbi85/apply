<?php
    namespace schleyer\bloggy;

    use schleyer\bloggy\models\SettinsModel;

    /**
     * User Guide Plugin
     */
    class Plugin extends \craft\base\Plugin
    {
        public $hasCpSection = true;
        public $hasCpSettings = true;

        public function init()
        {
            /** @var SettinsModel $settings */
            $settings = $this->getSettings();
            $this->hasCpSection = $settings->bloggyEnabled;
        }

        protected function createSettingsModel()
        {
            return new SettinsModel();
        }
        
        protected function settingsHtml()
        {
            return \Craft::$app->getView()->renderTemplate("bloggy/settings", [
                "settings" =>$this->getSettings()
        ]);
        }
    }