<?php

class ControllerModuleLatestReviews extends Controller
{
    protected function index($setting)
    {

        $this->document->addScript('catalog/view/javascript/jquery/jquery.jcarousel.min.js');

        if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css')) {
            $this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/carousel.css');
        } else {
            $this->document->addStyle('catalog/view/theme/default/stylesheet/carousel.css');
        }

        $this->language->load('module/latestReviews');

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['button_cart'] = $this->language->get('button_cart');

        $this->load->model('catalog/product');
        $this->load->model('catalog/review');

        $this->load->model('tool/image');

        $this->data['products'] = array();

        $data = array(
            'sort'  => 'r.date_added',
            'order' => 'DESC',
            'limit' => $setting['limit']
        );

        $results = $this->model_catalog_review->getReviewedProducts($data);

        foreach ($results as $result) {
            if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
            } else {
                $image = $this->model_tool_image->resize('no_image.jpg', $setting['image_width'], $setting['image_height']);
            }

            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }

            if ((float)$result['special']) {
                $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $special = false;
            }

            if ($this->config->get('config_review_status')) {
                $rating = $result['rating'];
            } else {
                $rating = false;
            }

            $text = html_entity_decode($result['text'], ENT_QUOTES, 'UTF-8');

            $ready_text = (strlen($text) >= $setting['entry_review_lenght'])?mb_substr($text, 0, $setting['entry_review_lenght']).' ...':$text;

            $this->data['products'][] = array(
                'product_id' => $result['product_id'],
                'thumb'   	 => $image,
                'name'    	 => $result['name'],
                'price'   	 => $price,
                'special' 	 => $special,
                'rating'     => $rating,
                'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                'author' 	 => $result['author'],
                'text' 	     => $ready_text,
                'date_added' 	 => $result['date_added'],
                'stock_status' 	 => $result['stock_status'],
            );

            $this->data['settings'] = array(
                'show' => $setting['vertical'],
                'limit' => $setting['limit'],
                'visible' => $setting['visible'],
                'scroll' => $setting['scroll'],
                'cycle' => ($setting['cycle'] == 0)?'first':'circular',
                'module' => $setting['layout_id'].'_'.$setting['entry_review_lenght']
            );
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/latestReviews.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/latestReviews.tpl';
        } else {
            $this->template = 'default/template/module/latestReviews.tpl';
        }

        $this->render();
    }
}
?>