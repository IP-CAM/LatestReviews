<div id="carousel<?php echo $settings['module']; ?>" class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="box-content">
        <ul class="jcarousel-skin-opencart">
            <?php foreach ($products as $product) { ?>
                <li>
                    <div>
                        <div class="image">
                            <a href="<?php echo $product['href']; ?>">
                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                            </a>
                        </div>
                        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                        <?php if ($product['price']) { ?>
                        <div class="price">
                            <?php if (!$product['special']) { ?>
                            <?php echo $product['price']; ?>
                            <?php } else { ?>
                            <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                            <?php } ?>
                        </div>
                        <?php } ?>
                        <?php if ($product['rating']) { ?>
                            <div class="rating">
                                <img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
                            </div>
                        <?php } ?>
                        <div class="">
                            <?php echo $product['author'] ?>
                            <br/>
                            <br/>
                            <?php echo $product['text'] ?>
                        </div>
                        <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
                    </div>
                </li>
            <?php } ?>
        </ul>
    </div>
</div>

<?php if($settings['show'] == 0 ) { ?> <!-- Make horizontal slider -->
<script type="text/javascript">
    <!--
    $('#carousel<?php echo $settings['module']; ?> ul').jcarousel({
        vertical: false,
        visible: <?php echo $settings['visible']; ?>,
        scroll: <?php echo $settings['scroll']; ?>,
    });
    //--></script>
<style type="text/css">
    #carousel<?php echo $settings['module']; ?> .jcarousel-skin-opencart .jcarousel-next-horizontal,
    #carousel<?php echo $settings['module']; ?> .jcarousel-skin-opencart .jcarousel-prev-horizontal {
        top: 85px;
    }
</style>
<?php } else { ?> <!-- Make vertical slider -->
<script type="text/javascript">
    <!--
    $('#carousel<?php echo $settings['module']; ?> ul').jcarousel({
        vertical: true,
        visible: <?php echo $settings['visible']; ?>,
        scroll: <?php echo $settings['scroll']; ?>

    });
    //--></script>
    <style type="text/css">
        #carousel<?php echo $settings['module']; ?> .jcarousel-skin-opencart .jcarousel-next-horizontal,
        #carousel<?php echo $settings['module']; ?> .jcarousel-skin-opencart .jcarousel-prev-horizontal {
            top: 85px;
        }

        #carousel<?php echo $settings['module']; ?> .jcarousel-prev,
        #carousel<?php echo $settings['module']; ?> .jcarousel-next {
            display: block;
            position: absolute;
            height: 32px;
            width: 180px;
            z-index: 99;
            display: none  !important;
        }

        #carousel<?php echo $settings['module']; ?> .jcarousel-prev.jcarousel-prev-vertical {
            top: 0;
            background: url('catalog/view/theme/default/image/button-next.png') center no-repeat;
        }

        #carousel<?php echo $settings['module']; ?> .jcarousel-next.jcarousel-next-vertical {
            bottom: 0;
            background: url('catalog/view/theme/default/image/button-previous.png') center no-repeat;
        }

        #carousel<?php echo $settings['module']; ?> .jcarousel-list.jcarousel-list-vertical {
            height: 655px !important;
        }
        #carousel<?php echo $settings['module']; ?> .jcarousel-list.jcarousel-list-vertical .jcarousel-item {
            height: 220px !important;
            width: 180px;
        }
    </style>
<?php } ?>