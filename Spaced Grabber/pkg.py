try:
    import pkg_resources
except ImportError:
    print("pkg_resources is not installed. Install it using 'pip install pkg_resources'")
else:
    print("pkg_resources installed")