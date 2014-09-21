debug_screen(){
commander xwininfo -root -tree
xcowfortune -t 3 &
sleep 1 
commander "import -window root $file_product_cover"
}

debug_screen
