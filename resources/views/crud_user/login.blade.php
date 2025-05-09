@extends('dashboard')

@section('content')
<main>
    <div class="login-form">
        <h1>MÀN HÌNH ĐĂNG NHẬP</h1>
        <form method="POST" action="{{ route('user.authUser') }}">
            @csrf
            <label for="email">Email</label>
            <input type="text" id="email" name="email" placeholder="email" required autofocus><br>
            @if ($errors->has('email'))
                <span class="text-danger">{{ $errors->first('email') }}</span>
            @endif
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" placeholder="password" required autofocus><br>
            @if ($errors->has('password'))
                <span class="text-danger">{{ $errors->first('password') }}</span>
            @endif
            <input type="checkbox" id="remember" name="remember" checked>
            <label for="remember">Ghi nhớ đăng nhập</label><br>
            <a href="#">Quên mật khẩu</a>
            <button type="submit">Đăng nhập</button>
        </form>
    </div>
</main>
@endsection