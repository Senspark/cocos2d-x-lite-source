package com.enhance.gameservice;

public interface IGameTuningService extends android.os.IInterface {
    /** Default implementation for IGameTuningService. */
    public static class Default implements com.enhance.gameservice.IGameTuningService
    {
        @Override public int setPreferredResolution(int resolution) throws android.os.RemoteException
        {
            return 0;
        }
        @Override public int setFramePerSecond(int fps) throws android.os.RemoteException
        {
            return 0;
        }
        @Override public int boostUp(int seconds) throws android.os.RemoteException
        {
            return 0;
        }
        @Override public int getAbstractTemperature() throws android.os.RemoteException
        {
            return 0;
        }
        @Override public int setGamePowerSaving(boolean enable) throws android.os.RemoteException
        {
            return 0;
        }
        @Override
        public android.os.IBinder asBinder() {
            return null;
        }
    }
    /** Local-side IPC implementation stub class. */
    public static abstract class Stub extends android.os.Binder implements com.enhance.gameservice.IGameTuningService
    {
        /** Construct the stub at attach it to the interface. */
        public Stub()
        {
            this.attachInterface(this, DESCRIPTOR);
        }
        /**
         * Cast an IBinder object into an com.enhance.gameservice.IGameTuningService interface,
         * generating a proxy if needed.
         */
        public static com.enhance.gameservice.IGameTuningService asInterface(android.os.IBinder obj)
        {
            if ((obj==null)) {
                return null;
            }
            android.os.IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (((iin!=null)&&(iin instanceof com.enhance.gameservice.IGameTuningService))) {
                return ((com.enhance.gameservice.IGameTuningService)iin);
            }
            return new com.enhance.gameservice.IGameTuningService.Stub.Proxy(obj);
        }
        @Override public android.os.IBinder asBinder()
        {
            return this;
        }
        @Override public boolean onTransact(int code, android.os.Parcel data, android.os.Parcel reply, int flags) throws android.os.RemoteException
        {
            java.lang.String descriptor = DESCRIPTOR;
            if (code >= android.os.IBinder.FIRST_CALL_TRANSACTION && code <= android.os.IBinder.LAST_CALL_TRANSACTION) {
                data.enforceInterface(descriptor);
            }
            switch (code)
            {
                case INTERFACE_TRANSACTION:
                {
                    reply.writeString(descriptor);
                    return true;
                }
            }
            switch (code)
            {
                case TRANSACTION_setPreferredResolution:
                {
                    int _arg0;
                    _arg0 = data.readInt();
                    int _result = this.setPreferredResolution(_arg0);
                    reply.writeNoException();
                    reply.writeInt(_result);
                    break;
                }
                case TRANSACTION_setFramePerSecond:
                {
                    int _arg0;
                    _arg0 = data.readInt();
                    int _result = this.setFramePerSecond(_arg0);
                    reply.writeNoException();
                    reply.writeInt(_result);
                    break;
                }
                case TRANSACTION_boostUp:
                {
                    int _arg0;
                    _arg0 = data.readInt();
                    int _result = this.boostUp(_arg0);
                    reply.writeNoException();
                    reply.writeInt(_result);
                    break;
                }
                case TRANSACTION_getAbstractTemperature:
                {
                    int _result = this.getAbstractTemperature();
                    reply.writeNoException();
                    reply.writeInt(_result);
                    break;
                }
                case TRANSACTION_setGamePowerSaving:
                {
                    boolean _arg0;
                    _arg0 = (0!=data.readInt());
                    int _result = this.setGamePowerSaving(_arg0);
                    reply.writeNoException();
                    reply.writeInt(_result);
                    break;
                }
                default:
                {
                    return super.onTransact(code, data, reply, flags);
                }
            }
            return true;
        }
        private static class Proxy implements com.enhance.gameservice.IGameTuningService
        {
            private android.os.IBinder mRemote;
            Proxy(android.os.IBinder remote)
            {
                mRemote = remote;
            }
            @Override public android.os.IBinder asBinder()
            {
                return mRemote;
            }
            public java.lang.String getInterfaceDescriptor()
            {
                return DESCRIPTOR;
            }
            @Override public int setPreferredResolution(int resolution) throws android.os.RemoteException
            {
                android.os.Parcel _data = android.os.Parcel.obtain();
                android.os.Parcel _reply = android.os.Parcel.obtain();
                int _result;
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeInt(resolution);
                    boolean _status = mRemote.transact(Stub.TRANSACTION_setPreferredResolution, _data, _reply, 0);
                    _reply.readException();
                    _result = _reply.readInt();
                }
                finally {
                    _reply.recycle();
                    _data.recycle();
                }
                return _result;
            }
            @Override public int setFramePerSecond(int fps) throws android.os.RemoteException
            {
                android.os.Parcel _data = android.os.Parcel.obtain();
                android.os.Parcel _reply = android.os.Parcel.obtain();
                int _result;
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeInt(fps);
                    boolean _status = mRemote.transact(Stub.TRANSACTION_setFramePerSecond, _data, _reply, 0);
                    _reply.readException();
                    _result = _reply.readInt();
                }
                finally {
                    _reply.recycle();
                    _data.recycle();
                }
                return _result;
            }
            @Override public int boostUp(int seconds) throws android.os.RemoteException
            {
                android.os.Parcel _data = android.os.Parcel.obtain();
                android.os.Parcel _reply = android.os.Parcel.obtain();
                int _result;
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeInt(seconds);
                    boolean _status = mRemote.transact(Stub.TRANSACTION_boostUp, _data, _reply, 0);
                    _reply.readException();
                    _result = _reply.readInt();
                }
                finally {
                    _reply.recycle();
                    _data.recycle();
                }
                return _result;
            }
            @Override public int getAbstractTemperature() throws android.os.RemoteException
            {
                android.os.Parcel _data = android.os.Parcel.obtain();
                android.os.Parcel _reply = android.os.Parcel.obtain();
                int _result;
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    boolean _status = mRemote.transact(Stub.TRANSACTION_getAbstractTemperature, _data, _reply, 0);
                    _reply.readException();
                    _result = _reply.readInt();
                }
                finally {
                    _reply.recycle();
                    _data.recycle();
                }
                return _result;
            }
            @Override public int setGamePowerSaving(boolean enable) throws android.os.RemoteException
            {
                android.os.Parcel _data = android.os.Parcel.obtain();
                android.os.Parcel _reply = android.os.Parcel.obtain();
                int _result;
                try {
                    _data.writeInterfaceToken(DESCRIPTOR);
                    _data.writeInt(((enable)?(1):(0)));
                    boolean _status = mRemote.transact(Stub.TRANSACTION_setGamePowerSaving, _data, _reply, 0);
                    _reply.readException();
                    _result = _reply.readInt();
                }
                finally {
                    _reply.recycle();
                    _data.recycle();
                }
                return _result;
            }
        }
        static final int TRANSACTION_setPreferredResolution = (android.os.IBinder.FIRST_CALL_TRANSACTION + 0);
        static final int TRANSACTION_setFramePerSecond = (android.os.IBinder.FIRST_CALL_TRANSACTION + 1);
        static final int TRANSACTION_boostUp = (android.os.IBinder.FIRST_CALL_TRANSACTION + 2);
        static final int TRANSACTION_getAbstractTemperature = (android.os.IBinder.FIRST_CALL_TRANSACTION + 3);
        static final int TRANSACTION_setGamePowerSaving = (android.os.IBinder.FIRST_CALL_TRANSACTION + 4);
    }
    public static final java.lang.String DESCRIPTOR = "com.enhance.gameservice.IGameTuningService";
    public int setPreferredResolution(int resolution) throws android.os.RemoteException;
    public int setFramePerSecond(int fps) throws android.os.RemoteException;
    public int boostUp(int seconds) throws android.os.RemoteException;
    public int getAbstractTemperature() throws android.os.RemoteException;
    public int setGamePowerSaving(boolean enable) throws android.os.RemoteException;
}