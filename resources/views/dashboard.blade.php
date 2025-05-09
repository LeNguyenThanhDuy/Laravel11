<!DOCTYPE html>
<html>

<head>
    <title>Laravel 10.48.0 - CRUD User Example</title>
    <link href="{{ asset('css/styles.css') }}" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
    <header>
        <nav>
            @guest
            <a href="{{ route('login') }}">Home</a> |
            <a href="{{ route('login') }}">Đăng nhập</a> |
            <a href="{{ route('user.createUser') }}">Đăng ký</a>
            @else
            <a href="{{ route('user.list') }}">Home</a> |
            <a href="{{ route('signout') }}">Đăng xuất</a>
            @endguest
        </nav>
    </header>
    @yield('content')
    <footer>
        <p>Lập trình web @01/2024</p>
    </footer>
    <script type="text/javascript" src="{{ asset('js/scripts.js') }}"></script>
</body>

</html>