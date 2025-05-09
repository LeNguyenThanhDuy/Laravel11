@extends('dashboard')

@section('content')
<main>
    <div class="update-form">
        <h1>Màn hình cập nhật</h1>
        <form action="{{ route('user.postUpdateUser') }}" method="POST">
            @csrf
            <input name="id" type="hidden" value="{{$user->id}}">

            <label for="username">Username</label>
            <input type="text" id="name" name="name" value="{{$user->name}}"><br>
            @if ($errors->has('name'))
                <span class="text-danger">{{ $errors->first('name') }}</span>
            @endif

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="{{$user->email}}"><br>
            @if ($errors->has('email'))
                <span class="text-danger">{{ $errors->first('email') }}</span>
            @endif


            <!-- <label for="username">Like</label>
            <input type="text" placeholder="Like" id="like" name="like" required autofocus><br>
            @if ($errors->has('like'))
                <span class="text-danger">{{ $errors->first('like') }}</span>
            @endif
            <label for="username">Github</label>
            <input type="text" placeholder="GitHub" id="github" name="github" required autofocus><br>
            @if ($errors->has('github'))
                <span class="text-danger">{{ $errors->first('github') }}</span>
            @endif -->




            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password"><br>
            @if ($errors->has('password'))
                <span class="text-danger">{{ $errors->first('password') }}</span>
            @endif

            <!-- <label for="confirm_password">Nhập lại mật khẩu</label>
            <input type="password" id="confirm_password" name="confirm_password"  ><br> -->
            <button type="submit">Cập nhật</button>
        </form>
    </div>
</main>
    @endsection