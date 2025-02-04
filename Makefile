info:
	@echo "Use 'make gtk2' for GTK+ 2 example, or 'make gtk3' for GTK+ 3 example."

gtk3:
	@echo "----------------------------------------------------------------------"
	@rm -f Release/cefcapi-gtk3
	@clear
	gcc -std=c99 -Wall -Werror -o Release/cefcapi-gtk3 -I. -I.. -Wl,-rpath,. -L./Release examples/main_linux.c -lX11 -lcef `pkg-config --libs --cflags gtk+-3.0`
	cd Release/ && GDK_BACKEND=x11 ./cefcapi-gtk3 && cd ../

