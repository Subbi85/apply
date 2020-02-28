<?php
namespace schleyer\bloggy\models;

class SettinsModel extends \craft\base\Model
{
    public $bloggyEnabled = true;
    public $markdownText="";
    public $notificationEmail ="";
}