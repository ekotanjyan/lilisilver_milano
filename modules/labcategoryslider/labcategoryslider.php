<?php
class labcategoryslider extends Module {
	private $spacer_size = '5';	
	private $_postErrors  = array();	
	public function __construct() {
		$this->name 		= 'labcategoryslider';
		$this->tab 			= 'front_office_features';
		$this->version 		= '1.6';
        $this->bootstrap    = true;
        $this->_html        = '';
		$this->author 		= 'labersthemes';
		$this->displayName 	= $this->l('List Category Products Slider');
		$this->description 	= $this->l('List Category Products Slider');
		parent :: __construct();
	}
	
	public function install() {
	Configuration::updateValue('_tab_effect', 'wiggle');
	Configuration::updateValue('min_cout_product', 9);
	Configuration::updateValue('_show_arrow', 0);
    Db::getInstance()->execute('CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'lab_categoryslider` (
			  `id_categoryslider` int(10) unsigned NOT NULL AUTO_INCREMENT,
			  `image` varchar(128) NOT NULL,
			  `id_category` int(10) unsigned NOT NULL,
			  PRIMARY KEY (`id_categoryslider`)
			) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15'
        );

	$arrayDefault = array('CAT3','CAT4','CAT5');
	$cateDefault = implode(',',$arrayDefault);
	Configuration::updateGlobalValue($this->name.'_list_cate',$cateDefault);
		return parent :: install()
			&& $this->registerHook('header')
			&& $this->registerHook('blockPosition3');
	}

      public function uninstall() {
		Configuration::deleteByName($this->name . '_list_cate');
        $this->_clearCache('labcategoryslider.tpl');
        return parent::uninstall();
    }
	public function psversion() {
		$version=_PS_VERSION_;
		$exp=$explode=explode(".",$version);
		return $exp[1];
	}

    public function hookHeader($params){
        if ($this->psversion()==5){
            $this->context->controller->addCSS(($this->_path).'labcategoryslider.css', 'all');
        } else {
            Tools::addCSS(($this->_path).'labcategoryslider.css');
        }
    }
    // Hook Home
	public function hookblockPosition3($params) {
	        $nb =  Configuration::get('min_cout_product');
			$product_on_row = Configuration::get($this->name . '_p_on_row');
		    $arrayCategory = array();
			$catSelected = Configuration::get($this->name . '_list_cate');
			$cateArray = explode(',', $catSelected); 
			$id_lang =(int) Context::getContext()->language->id;
			$id_shop = (int) Context::getContext()->shop->id;
			$arrayProductCate = array();
			foreach($cateArray as $id_category) {
				$id_category = str_replace('CAT','',$id_category);
				$category = new Category((int) $id_category, (int) $id_lang, (int) $id_shop);
				$categoryProducts = $category->getProducts($this->context->language->id, 0, ($nb ? $nb : 5));
				if($categoryProducts) {
					$arrayProductCate[] = array('id' => $id_category, 'description'=> $category->description, 'name'=> $category->name, 'product' => $categoryProducts);
				}
			}
			$options = array(
				'show_arrow' => Configuration::get('_show_arrow'),
				'min_item' => Configuration::get('min_item'),
				'min_row' => Configuration::get('min_row'),
			);
			$this->context->smarty->assign('slideOptions', $options);
            $this->smarty->assign(array(
				'productCates' => $arrayProductCate,
				'tab_effect' => Configuration::get($this->name . '_tab_effect'),
            ));
		return $this->display(__FILE__, 'labcategoryslider.tpl');
	}
	public function hookblockPosition4($params) {
	        $nb =  Configuration::get('min_cout_product');
			$product_on_row = Configuration::get($this->name . '_p_on_row');
		    $arrayCategory = array();
			$catSelected = Configuration::get($this->name . '_list_cate');
			$cateArray = explode(',', $catSelected); 
			$id_lang =(int) Context::getContext()->language->id;
			$id_shop = (int) Context::getContext()->shop->id;
			$arrayProductCate = array();
			foreach($cateArray as $id_category) {
				$id_category = str_replace('CAT','',$id_category);
				$category = new Category((int) $id_category, (int) $id_lang, (int) $id_shop);
				$categoryProducts = $category->getProducts($this->context->language->id, 0, ($nb ? $nb : 5));
				if($categoryProducts) {
					$arrayProductCate[] = array('id' => $id_category, 'description'=> $category->description, 'name'=> $category->name, 'product' => $categoryProducts);
				}
			}
			$options = array(
				'show_arrow' => Configuration::get('_show_arrow'),
				'min_item' => Configuration::get('min_item'),
				'min_row' => Configuration::get('min_row'),
			);
			$this->context->smarty->assign('slideOptions', $options);
            $this->smarty->assign(array(
				'productCates' => $arrayProductCate,
				'tab_effect' => Configuration::get($this->name . '_tab_effect'),
            ));
		return $this->display(__FILE__, 'labcategoryslider.tpl');
	}
	private function _installHookCustomer(){
		$hookspos = array(
				'tabCategory',
			); 
		foreach( $hookspos as $hook ){
			if( Hook::getIdByName($hook) ){
			} else {
				$new_hook = new Hook();
				$new_hook->name = pSQL($hook);
				$new_hook->title = pSQL($hook);
				$new_hook->add();
				$id_hook = $new_hook->id;
			}
		}
		return true;
	}
	
	  public function getContent() {
        $output = '<h2>' . $this->displayName . '</h2>';
        if (Tools::isSubmit('submitUpdate')) {
            if (!sizeof($this->_postErrors))
                $this->_postProcess();
            else {
                foreach ($this->_postErrors AS $err) {
                    $this->_html .= '<div class="alert error">' . $err . '</div>';
                }
            }
        }
        return $output .$this->_html . $this->_displayForm();
    }

    public function getSelectOptionsHtml($options = NULL, $name = NULL, $selected = NULL) {
        $html = "";
        $html .='<select name =' . $name . ' style="width:130px">';
        if (count($options) > 0) {
            foreach ($options as $key => $val) {
                if (trim($key) == trim($selected)) {
                    $html .='<option value=' . $key . ' selected="selected">' . $val . '</option>';
                } else {
                    $html .='<option value=' . $key . '>' . $val . '</option>';
                }
            }
        }
        $html .= '</select>';
        return $html;
    }
    private function _postProcess() {
        Configuration::updateValue($this->name.'_list_cate', implode(',', Tools::getValue('list_cate')));
		Configuration::updateValue('tab_effect', Tools::getValue('tab_effect'));
        Configuration::updateValue('_show_arrow', Tools::getValue('show_arrow'));
        Configuration::updateValue('min_cout_product', Tools::getValue('min_cout_product'));
        $this->_html .= $this->displayConfirmation($this->l('Configuration updated'));
    }
   /* private function imageForm(){
        $id_lang = (int) Context::getContext()->language->id;
        $options =    $this->getCategoryOption(1, (int)$id_lang, (int)Shop::getContextShopID());
        $fields_form = array(
            'form' => array(
                'legend' => array(
                    'title' => $this->l('Block categories link'),
                    'icon' => 'icon-link'
                ),
                'input' => array(
                    array(
                        'type' => 'text',
                        'label' => 'Title',
                        'name' => 'title',
                    ),
                    array(
                        'type' => 'selectlist',
                        'label' => 'Show Category Icon:',
                        'name' => 'image_cate[]',
                    ),

                ),
                'submit' => array(
                    'title' => $this->l('Save'),
                    'name' => 'submitUpdate',
                ),
            ));
        $helper = new HelperForm();
        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->submit_action = 'submitUpdate';
        $lang = new Language((int)Configuration::get('PS_LANG_DEFAULT'));
        $helper->default_form_language = $lang->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') ? Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') : 0;
        $this->fields_form = array();
        $helper->module = $this;
        $helper->options = $options;
        $helper->identifier = $this->identifier;
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false) . '&configure=' . $this->name . '&tab_module=' . $this->tab . '&module_name=' . $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $module = _PS_MODULE_DIR_ ;
        $helper->tpl_vars = array(
            'module' =>$module,
            'fields_value' => $this->getConfigFieldsValues(),
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id,
            'options' => $options,
        );
        $helper->override_folder = '/';
        return $helper->generateForm(array($fields_form));


    }*/
	private function _displayForm(){
		$spacer = str_repeat('&nbsp;', $this->spacer_size);
        $id_lang = (int) Context::getContext()->language->id;
        // var_dump($this->getCategoryOption(1, (int)$id_lang, (int)Shop::getContextShopID()));die;
	    $tabEffect = array();
        $id_lang = (int) Context::getContext()->language->id;
				//	$this->getCategoryOption(1, (int) $id_lang, (int) Shop::getContextShopID());
		$tabEffect = array(
            array( 'id'=>'none','mode'=>'None'),
            array('id'=>'hinge','mode'=>'Hinge'),
            array('id'=>'flash','mode'=>'Flash'),
            array('id'=>'shake','mode'=>'Shake'),
            array('id'=>'bounce','mode'=>'bounce'),
            array('id'=>'tada','mode'=>'Tada'),
            array('id'=>'swing','mode'=>'Swing'),
            array('id'=>'wobble','mode'=>'Wobble'),
            array('id'=>'pulse','mode'=>'Pulse'),
            array('id'=>'flip','mode'=>'Flip'),
            array('id'=>'flipInX','mode'=>'flipInX'),
            array('id'=>'flipInY','mode'=>'flipInY'),
            array('id'=>'fadeIn','mode'=>'fadeIn'),
            array('id'=>'bounceInUp','mode'=>'bounceInUp'),
            array('id'=>'fadeInLeft','mode'=>'fadeInLeft'),
            array('id'=>'rollIn','mode'=>'rollIn'),
            array('id'=>'lightSpeedIn','mode'=>'lightSpeedIn'),
            array('id'=>'wiggle','mode'=>'wiggle'),
            array('id'=>'rotateIn','mode'=>'rotateIn'),
            array('id'=>'rotateInUpLeft','mode'=>'rotateInUpLeft'),
            array('id'=>'rotateInUpRight','mode'=>'rotateInUpRight'),
		);

        $id_lang = (int) Context::getContext()->language->id;
        $options =    $this->getCategoryOption(1, (int)$id_lang, (int)Shop::getContextShopID());
        $fields_form = array(
            'form' => array(
                'legend' => array(
                    'title' => $this->l('Block categories link'),
                    'icon' => 'icon-link'
                ),
                'input' => array(
                    /* array(
                        'type' => 'text',
                        'label' => 'Title',
                        'name' => 'title',
                    ), */
                    array(
                        'type' => 'switch',
                        'label' => 'autoPlay',
                        'name' => 'show_arrow',
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => 1,
                                'label' => $this->l('Enabled')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => 0,
                                'label' => $this->l('Disabled')
                            )
                        ),
                    ),

                    /* array(
                        'type' => 'select',
                        'label' => 'Effect Tab: ',
                        'name' => 'tab_effect',
                        'options' => array(                                  // This is only useful if type == select
                            'query' => $tabEffect,                           // $array_of_rows must contain an array of arrays, inner arrays (rows) being mode of many fields
                            'id' => 'id',                           // The key that will be used for each option "value" attribute
                            'name'=>'mode',
                        ),
                    ), */
                    array(
                        'type' => 'selectlist',
                        'label' => 'Show Link/Label Category:',
                        'name' => 'list_cate[]',
                        'multiple'=>true,
						
                    ),
					array(
                        'type' => 'text',
                        'label' => 'Products limit:',
                        'name' => 'min_cout_product',
                    ),
                ),
                'submit' => array(
                    'title' => $this->l('Save'),
                    'name' => 'submitUpdate',
                ),
            ));
        $helper = new HelperForm();
        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->submit_action = 'submitUpdate';
        $lang = new Language((int)Configuration::get('PS_LANG_DEFAULT'));
        $helper->default_form_language = $lang->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') ? Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') : 0;
        $this->fields_form = array();
        $helper->module = $this;
        $helper->options = $options;
        $helper->identifier = $this->identifier;
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false) . '&configure=' . $this->name . '&tab_module=' . $this->tab . '&module_name=' . $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $module = _PS_MODULE_DIR_ ;
        $helper->tpl_vars = array(
            'module' =>$module,
            'fields_value' => $this->getConfigFieldsValues(),
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id,
            'options' => $options,
        );
        $helper->override_folder = '/';
        return $helper->generateForm(array($fields_form));
	}
    public function getConfigFieldsValues()
    {
        return array(
            'show_arrow' => Tools::getValue('show_arrow', Configuration::get('show_arrow')),
            'list_cate[]' => Tools::getValue('list_cate', Configuration::get($this->name.'_list_cate')),
            'min_item' => Tools::getValue('min_item', Configuration::get('min_item')),
            'min_cout_product' => Tools::getValue('min_cout_product', Configuration::get('min_cout_product')),
            'min_row' => Tools::getValue('min_row', Configuration::get('min_row')),
        );
    }

     private function getCategoryOption($id_category = 1, $id_lang = false, $id_shop = false, $recursive = true) {
		$cateCurrent = Configuration::get($this->name . '_list_cate');
		$cateCurrent = explode(',', $cateCurrent);
		$id_lang = $id_lang ? (int)$id_lang : (int)Context::getContext()->language->id;
		$category = new Category((int)$id_category, (int)$id_lang, (int)$id_shop);
		if (is_null($category->id))
			return;
		if ($recursive)
		{
			$children = Category::getChildren((int)$id_category, (int)$id_lang, true, (int)$id_shop);
			$spacer = str_repeat('&nbsp;', $this->spacer_size * (int)$category->level_depth);
		}
		$shop = (object) Shop::getShop((int)$category->getShopID());
		        if (in_array('CAT'.(int)$category->id, $cateCurrent)) {
					$this->_html .= '<option value="CAT'.(int)$category->id.'" selected ="selected" >'.(isset($spacer) ? $spacer : '').$category->name.' ('.$shop->name.')</option>';
				} else {
					$this->_html .= '<option value="CAT'.(int)$category->id.'">'.(isset($spacer) ? $spacer : '').$category->name.' ('.$shop->name.')</option>';
				}
		if (isset($children) && count($children))
			foreach ($children as $child)
				$this->getCategoryOption((int)$child['id_category'], (int)$id_lang, (int)$child['id_shop']);
         return $this->_html ;
    }


	
}