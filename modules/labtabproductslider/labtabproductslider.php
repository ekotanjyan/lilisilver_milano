<?php

class labtabproductslider extends Module {
	var $_postErrors  = array();
	public function __construct() {
		$this->name 		= 'labtabproductslider';
		$this->tab 			= 'front_office_features';
		$this->version 		= '1.5';
        $this->bootstrap =true;
		$this->author 		= 'labersthemes';
		$this->displayName 	= $this->l('Lab Product Tabs Slider');
		$this->description 	= $this->l('Product Tabs Slider');
        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
		parent :: __construct();
       
	}
	
	public function install() {

	    Configuration::updateValue($this->name . '_show_new', 1);
        Configuration::updateValue($this->name . '_show_sale', 1);
        Configuration::updateValue($this->name . '_show_feature', 1);
        Configuration::updateValue($this->name . '_show_best', 0);
		Configuration::updateValue($this->name . '_p_limit', 20);
		return parent :: install()
			&& $this->registerHook('blockPosition2')
			&& $this->registerHook('header');
	}

      public function uninstall() {
        $this->_clearCache('productab.tpl');
        return parent::uninstall();
    }

  
	public function psversion() {
		$version=_PS_VERSION_;
		$exp=$explode=explode(".",$version);
		return $exp[1];
	}
    
	public function hookdisplayHeader($params)
	{
		if (!isset($this->context->controller->php_self))
			return;
		$this->context->controller->addCSS($this->_path.'producttab.css');
	}
	public function hookblockPosition2($params) {
	        $nb = Configuration::get($this->name . '_p_limit');
			$newProducts = Product::getNewProducts((int) Context::getContext()->language->id, 0, ($nb ? $nb : 5));
			$specialProducts = Product::getPricesDrop((int) Context::getContext()->language->id, 0, ($nb ? $nb : 5));
			ProductSale::fillProductSales();
			$bestseller =  $this->getBestSales ((int) Context::getContext()->language->id, 0, ($nb ? $nb : 5), null,  null);
			$category = new Category(Context::getContext()->shop->getCategory(), (int) Context::getContext()->language->id);
         	$featureProduct = $category->getProducts((int) Context::getContext()->language->id, 0, ($nb ? $nb : 5));

			$languages = Language::getLanguages(true, $this->context->shop->id);
			if(!$newProducts) $newProducts = null;
			if(!$bestseller) $bestseller = null;
			if(!$specialProducts) $specialProducts = null;
			
			$productTabslider = array();
			
			if(Configuration::get($this->name . '_show_new')) {
				$productTabslider[] = array('id'=>'new_product', 'name' => $this->l('New'), 'productInfo' => $newProducts);
			}
			if(Configuration::get($this->name . '_show_feature')) {
				$productTabslider[] = array('id'=>'feature_product','name' => $this->l('Featured'), 'productInfo' =>  $featureProduct);
			}
			if(Configuration::get($this->name . '_show_sale')) {
				$productTabslider[] = array('id'=> 'special_product','name' => $this->l('Sale'), 'productInfo' =>  $specialProducts);
			}
			if(Configuration::get($this->name . '_show_best')) {
				$productTabslider[] = array('id'=>'besseller_product','name' => $this->l('Best seller'), 'productInfo' =>  $bestseller);
			}
			
	
				$options = array(
					'min_item' => Configuration::get($this->name . '_min_item'),
				);

            $this->smarty->assign(array(
                'add_prod_display' => Configuration::get('PS_ATTRIBUTE_CATEGORY_DISPLAY'),
                'homeSize' => Image::getSize(ImageType::getFormatedName('home')),
				'tab_effect' => Configuration::get($this->name . '_tab_effect'),
				'languages' => $languages,
	
            ));
			$this->context->smarty->assign('productTabslider', $productTabslider);
			$this->context->smarty->assign('slideOptions', $options);
		return $this->display(__FILE__, 'producttabslider.tpl');
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
        return $output . $this->_displayForm();
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

        Configuration::updateValue($this->name . '_show_new', Tools::getValue('show_new'));
        Configuration::updateValue($this->name . '_show_sale', Tools::getValue('show_sale'));
        Configuration::updateValue($this->name . '_show_feature', Tools::getValue('show_feature'));
        Configuration::updateValue($this->name . '_show_best', Tools::getValue('show_best'));
        Configuration::updateValue($this->name . '_p_limit', Tools::getValue('p_limit'));
        $this->_html .=  $this->displayConfirmation($this->l('Configuration updated')) ;
    }
	
	private function _displayForm(){
        $fields_form = array(
            'form' => array(
                'legend' => array(
                    'title' => $this->l('Sectting'),
                    'icon' => 'icon-link'
                ),
                'input' => array(

                    array(
                        'type' => 'switch',
                        'label' => $this->l('Show New Products:'),
                        'name' => 'show_new',
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
                    array(
                        'type' => 'switch',
                        'label' => $this->l('Show special Products:'),
                        'name' => 'show_sale',
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
                    array(
                        'type' => 'switch',
                        'label' => $this->l('Show Bestselling Products: '),
                        'name' => 'show_best',
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
                    array(
                        'type' => 'switch',
                        'label' => $this->l('Show Feature Products: '),
                        'name' => 'show_feature',
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
                   array(
                       'type' => 'text',
                       'label' => 'Products Limit:',
                       'name' => 'p_limit',
                   ),
                ),
                'submit' => array(
                    'title' => $this->l('Save'),
                    'name' => 'submitUpdate',
                ),
            )
        );
        $helper = new HelperForm();
        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->submit_action = 'submitUpdate';
        $lang = new Language((int)Configuration::get('PS_LANG_DEFAULT'));
        $helper->default_form_language = $lang->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') ? Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG') : 0;
        $this->fields_form = array();
        $helper->module = $this;
        $helper->identifier = $this->identifier;
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false) . '&configure=' . $this->name . '&tab_module=' . $this->tab . '&module_name=' . $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $module = _PS_MODULE_DIR_ ;
        $helper->tpl_vars = array(
            'module' =>$module,
            'fields_value' => $this->getConfigFieldsValues(),
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id,
        );
        return $helper->generateForm(array($fields_form));

	}



    public function getConfigFieldsValues()
    {
        return array(

        'show_new' =>     Tools::getValue('show_new', Configuration::get($this->name . '_show_new')),
        'show_sale' =>   Tools::getValue('show_sale', Configuration::get($this->name . '_show_sale')),
		'show_feature' =>     Tools::getValue('show_feature', Configuration::get($this->name . '_show_feature')),
        'show_best' =>    Tools::getValue('show_best', Configuration::get($this->name . '_show_best')),
		'p_limit' =>    Tools::getValue('p_limit', Configuration::get($this->name . '_p_limit')),
		'min_item' =>     Tools::getValue('min_item', Configuration::get($this->name . '_min_item')),
        );
    }
	private function _installHookCustomer(){
		$hookspos = array(
				'tabsProducts',
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
	public static function getBestSales($id_lang, $page_number = 0, $nb_products = 10, $order_by = null, $order_way = null)
	{
		if ($page_number < 0) $page_number = 0;
		if ($nb_products < 1) $nb_products = 10;
		$final_order_by = $order_by;
		$order_table = ''; 		
		if (is_null($order_by) || $order_by == 'position' || $order_by == 'price') $order_by = 'sales';
		if ($order_by == 'date_add' || $order_by == 'date_upd')
			$order_table = 'product_shop'; 				
		if (is_null($order_way) || $order_by == 'sales') $order_way = 'DESC';
		$groups = FrontController::getCurrentCustomerGroups();
		$sql_groups = (count($groups) ? 'IN ('.implode(',', $groups).')' : '= 1');
		$interval = Validate::isUnsignedInt(Configuration::get('PS_NB_DAYS_NEW_PRODUCT')) ? Configuration::get('PS_NB_DAYS_NEW_PRODUCT') : 20;
		
		$prefix = '';
		if ($order_by == 'date_add')
			$prefix = 'p.';
		
		$sql = 'SELECT p.*, product_shop.*, stock.out_of_stock, IFNULL(stock.quantity, 0) as quantity,
					pl.`description`, pl.`description_short`, pl.`link_rewrite`, pl.`meta_description`,
					pl.`meta_keywords`, pl.`meta_title`, pl.`name`,
					m.`name` AS manufacturer_name, p.`id_manufacturer` as id_manufacturer,
					MAX(image_shop.`id_image`) id_image, il.`legend`,
					ps.`quantity` AS sales, t.`rate`, pl.`meta_keywords`, pl.`meta_title`, pl.`meta_description`,
					DATEDIFF(p.`date_add`, DATE_SUB(NOW(),
					INTERVAL '.$interval.' DAY)) > 0 AS new
				FROM `'._DB_PREFIX_.'product_sale` ps
				LEFT JOIN `'._DB_PREFIX_.'product` p ON ps.`id_product` = p.`id_product`
				'.Shop::addSqlAssociation('product', 'p', false).'
				LEFT JOIN `'._DB_PREFIX_.'product_lang` pl
					ON p.`id_product` = pl.`id_product`
					AND pl.`id_lang` = '.(int)$id_lang.Shop::addSqlRestrictionOnLang('pl').'
				LEFT JOIN `'._DB_PREFIX_.'image` i ON (i.`id_product` = p.`id_product`)'.
				Shop::addSqlAssociation('image', 'i', false, 'image_shop.cover=1').'
				LEFT JOIN `'._DB_PREFIX_.'image_lang` il ON (i.`id_image` = il.`id_image` AND il.`id_lang` = '.(int)$id_lang.')
				LEFT JOIN `'._DB_PREFIX_.'manufacturer` m ON (m.`id_manufacturer` = p.`id_manufacturer`)
				LEFT JOIN `'._DB_PREFIX_.'tax_rule` tr ON (product_shop.`id_tax_rules_group` = tr.`id_tax_rules_group`)
					AND tr.`id_country` = '.(int)Context::getContext()->country->id.'
					AND tr.`id_state` = 0
				LEFT JOIN `'._DB_PREFIX_.'tax` t ON (t.`id_tax` = tr.`id_tax`)
				'.Product::sqlStock('p').'
				WHERE product_shop.`active` = 1
					AND product_shop.`visibility` != \'none\'
					AND p.`id_product` IN (
						SELECT cp.`id_product`
						FROM `'._DB_PREFIX_.'category_group` cg
						LEFT JOIN `'._DB_PREFIX_.'category_product` cp ON (cp.`id_category` = cg.`id_category`)
						WHERE cg.`id_group` '.$sql_groups.'
					)
				GROUP BY product_shop.id_product
				ORDER BY '.(!empty($order_table) ? '`'.pSQL($order_table).'`.' : '').'`'.pSQL($order_by).'` '.pSQL($order_way).'
				LIMIT '.(int)($page_number * $nb_products).', '.(int)$nb_products;

		$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);

		if ($final_order_by == 'price')
			Tools::orderbyPrice($result, $order_way);
		if (!$result)
			return false;
		return Product::getProductsProperties($id_lang, $result);
	}

}