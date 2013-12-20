<div id="carousel<?php echo $settings['module']; ?>">
    <ul class="jcarousel-skin-opencart">
        <?php foreach ($products as $product) { ?>
            <li>
                <div>
                    <?php if ($product['thumb']) { ?>
                    <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
                    <?php } ?>
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
                    <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
                    <?php } ?>
                    <div class="">
                        <?php echo $product['author'] ?>
                        <?php echo $product['text'] ?>
                    </div>
                    <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
                </div>
            </li>
        <?php } ?>
    </ul>
</div>
<?php var_dump($settings); ?>
<?php if($settings['show'] == 0 ) { ?> <!-- Make horizontal slider -->
<script type="text/javascript">
    <!--
    $('#carousel<?php echo $settings['module']; ?> ul').jcarousel({
        vertical: false,
        visible: <?php echo $settings['visible']; ?>,
        scroll: <?php echo $settings['scroll']; ?>,
    });
    //--></script>
<?php } else { ?> <!-- Make vertical slider -->
<script type="text/javascript">
    <!--
    $('#carousel<?php echo $settings['module']; ?> ul').jcarousel({
        vertical: true,
        visible: <?php echo $settings['visible']; ?>,
        scroll: <?php echo $settings['scroll']; ?>
    });
    //--></script>
<?php } ?>