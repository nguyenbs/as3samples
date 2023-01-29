// Decompiled by AS3 Sorcerer 5.24
// www.as3sorcerer.com

//net.house3d.framework.algorithm.data.utils.PointLineUtil

package com.swj.pureas.algorithm.data.utils
{
import com.swj.pureas.algorithm.data.datastructure.geometry.point.Endpoint2D;
import com.swj.pureas.algorithm.math.MathErrorConfig;
import com.swj.pureas.algorithm.utils.PointUtil;

    import flash.geom.Point;

    public class PointLineUtil 
    {

        private static var _lineIntersectionP1:Point = new Point();
        private static var _lineIntersectionP2:Point = new Point();
        private static var _lineIntersectionP3:Point = new Point();
        private static var _pointLineCoordinate:Vector.<Number> = new Vector.<Number>(3);
        private static var _pointLineDistance:Vector.<Number> = new Vector.<Number>(3);
        private static var _pointLineDistance2:Vector.<Number> = new Vector.<Number>(3);
        private static var _pointInSegmentP1:Point = new Point();
        private static var _pointInSegmentP2:Point = new Point();
        private static var _linePointIntersection:Vector.<Number> = new Vector.<Number>(3);


        public static function lineBooleanWrong(_arg_1:Point, _arg_2:Point, _arg_3:Point, _arg_4:Point):Vector.<Point>
        {
            var _local_10:Number;
            var _local_12:Number;
            var _local_11:Number;
            var _local_14:Number;
            var _local_6:Vector.<Point> = lineTwoSplit(_arg_1, _arg_2, _arg_3, _arg_4);
            var _local_13:Number = _local_6.length;
            var _local_7:Number = _local_6.indexOf(_arg_3);
            var _local_5:Number = _local_6.indexOf(_arg_4);
            var _local_9:Number = _local_6.lastIndexOf(_arg_3);
            var _local_8:Number = _local_6.lastIndexOf(_arg_4);
            if (Math.abs((_local_7 - _local_5)) < Math.abs((_local_9 - _local_8)))
            {
                _local_12 = _local_7;
                _local_11 = _local_5;
            }
            else
            {
                _local_12 = _local_9;
                _local_11 = _local_8;
            };
            if (_local_12 > _local_11)
            {
                _local_14 = _local_12;
                _local_12 = _local_11;
                _local_11 = _local_14;
            };
            var _local_15:Vector.<Point> = new Vector.<Point>();
            _local_10 = 0;
            while (_local_10 < _local_13)
            {
                if (!(((_local_10 >= _local_12) && ((_local_10 + 1) <= _local_11)) || (PointUtil.pointEqualError(_local_6[_local_10], _local_6[(_local_10 + 1)]))))
                {
                    _local_15.push(_local_6[_local_10], _local_6[(_local_10 + 1)]);
                };
                _local_10 = (_local_10 + 2);
            };
            return (_local_15);
        }

        public static function lineCoincidence(_arg_1:Point, _arg_2:Point, _arg_3:Point, _arg_4:Point):Vector.<Point>
        {
            var _local_6:Vector.<Point> = Vector.<Point>([_arg_1, _arg_2, _arg_3, _arg_4]);
            PointUtil.pointsSort(_local_6);
            var _local_7:Number = _local_6.indexOf(_arg_1);
            var _local_8:Number = _local_6.indexOf(_arg_2);
            var _local_5:Number = (_local_7 + _local_8);
            if (((_local_5 == 1) || (_local_5 == 5)))
            {
                return (null);
            };
            return (Vector.<Point>([_local_6[1], _local_6[2]]));
        }

        public static function lineMerge(_arg_1:Point, _arg_2:Point, _arg_3:Point, _arg_4:Point):Vector.<Point>
        {
            var _local_6:Vector.<Point> = Vector.<Point>([_arg_1, _arg_2, _arg_3, _arg_4]);
            PointUtil.pointsSort(_local_6);
            var _local_7:Number = _local_6.indexOf(_arg_1);
            var _local_8:Number = _local_6.indexOf(_arg_2);
            var _local_5:Number = (_local_7 + _local_8);
            if (((_local_5 == 1) || (_local_5 == 5)))
            {
                return (null);
            };
            return (Vector.<Point>([_local_6[0], _local_6[3]]));
        }

        public static function lineTwoSplit(_arg_1:Point, _arg_2:Point, _arg_3:Point, _arg_4:Point):Vector.<Point>
        {
            var _local_6:Vector.<Point> = Vector.<Point>([_arg_1, _arg_2, _arg_3, _arg_4]);
            PointUtil.pointsSort(_local_6);
            var _local_7:Number = _local_6.indexOf(_arg_1);
            var _local_8:Number = _local_6.indexOf(_arg_2);
            var _local_5:Number = (_local_7 + _local_8);
            if (((_local_5 == 1) || (_local_5 == 5)))
            {
                return (Vector.<Point>([_arg_1, _arg_2, _arg_3, _arg_4]));
            };
            if (PointUtil.pointEqualError(_local_6[1], _local_6[2]))
            {
                return (Vector.<Point>([_arg_1, _arg_2, _arg_3, _arg_4]));
            };
            return (Vector.<Point>([_local_6[0], _local_6[1], _local_6[1], _local_6[2], _local_6[2], _local_6[3]]));
        }

        public static function getCoincidenceIs(_arg_1:Point, _arg_2:Point, _arg_3:Point, _arg_4:Point, _arg_5:Number=NaN):Boolean
        {
            var _local_6:* = null;
            var _local_7:* = null;
            var _local_8:Boolean = PointLineUtil.pointInSegment(_arg_1, _arg_3, _arg_4, _arg_5);
            var _local_10:Boolean = PointLineUtil.pointInSegment(_arg_2, _arg_3, _arg_4, _arg_5);
            if (((_local_8 == true) && (_local_10 == true)))
            {
                return (true);
            };
            if (_local_8 == true)
            {
                _local_6 = _arg_1;
            }
            else
            {
                if (_local_10 == true)
                {
                    _local_6 = _arg_2;
                };
            };
            var _local_9:Boolean = PointLineUtil.pointInSegment(_arg_3, _arg_1, _arg_2, _arg_5);
            var _local_11:Boolean = PointLineUtil.pointInSegment(_arg_4, _arg_1, _arg_2, _arg_5);
            if (((_local_9 == true) && (_local_11 == true)))
            {
                return (true);
            };
            if (_local_9 == true)
            {
                _local_7 = _arg_3;
            }
            else
            {
                if (_local_11 == true)
                {
                    _local_7 = _arg_4;
                };
            };
            if (((!(_local_6 == null)) && (!(_local_7 == null))))
            {
                if (PointUtil.pointEqualError(_local_6, _local_7, _arg_5))
                {
                    return (false);
                };
                return (true);
            };
            return (false);
        }

        public static function lineIntersectionJudge(_arg_1:Point, _arg_2:Point, _arg_3:Point, _arg_4:Point, _arg_5:Number=0.001):Boolean
        {
            var _local_7:Number;
            var _local_6:Number;
            PointUtil.subtract(_arg_2, _arg_1, _lineIntersectionP1);
            PointUtil.subtract(_arg_4, _arg_1, _lineIntersectionP2);
            PointUtil.subtract(_arg_3, _arg_1, _lineIntersectionP3);
            _local_7 = VectorPointUtil.crossProduct(_lineIntersectionP1, _lineIntersectionP2);
            if (Math.abs(_local_7) < _arg_5)
            {
                return (false);
            };
            _local_6 = VectorPointUtil.crossProduct(_lineIntersectionP1, _lineIntersectionP3);
            if (Math.abs(_local_6) < _arg_5)
            {
                return (false);
            };
            if (((_local_7 < 0) && (_local_6 < 0)))
            {
                return (false);
            };
            if (((_local_7 > 0) && (_local_6 > 0)))
            {
                return (false);
            };
            PointUtil.subtract(_arg_4, _arg_3, _lineIntersectionP1);
            PointUtil.subtract(_arg_1, _arg_3, _lineIntersectionP2);
            PointUtil.subtract(_arg_2, _arg_3, _lineIntersectionP3);
            _local_7 = VectorPointUtil.crossProduct(_lineIntersectionP1, _lineIntersectionP2);
            if (Math.abs(_local_7) < _arg_5)
            {
                return (false);
            };
            _local_6 = VectorPointUtil.crossProduct(_lineIntersectionP1, _lineIntersectionP3);
            if (Math.abs(_local_6) < _arg_5)
            {
                return (false);
            };
            if (((_local_7 < 0) && (_local_6 < 0)))
            {
                return (false);
            };
            if (((_local_7 > 0) && (_local_6 > 0)))
            {
                return (false);
            };
            return (true);
        }

        /*public static function getLinePath(_arg_1:Vector.<Point>):Vector.<Point>
        {
            var _local_7:Number;
            var _local_8:*;
            var _local_9:*;
            var _local_2:Number;
            var _local_3:Number = _arg_1.length;
            var _local_10:EulerTableAngleSortPath = new EulerTableAngleSortPath();
            var _local_6:Vector.<Endpoint2D> = PointUtil.getEndpiont2D(_arg_1);
            _local_7 = 0;
            while (_local_7 < _local_3)
            {
                _local_10.addLine(new CircleArcStraightLineCurve2D(_local_6[_local_7], _local_6[(_local_7 + 1)], 0));
                _local_7 = (_local_7 + 2);
            };
            _local_10.deleteNotClosed();
            var _local_5:Vector.<Vector.<int>> = _local_10.getClosedPaths();
            if (_local_5.length == 2)
            {
                return (getPointsFromRelation(_local_10.getPoints(_local_5[0])));
            };
            _local_3 = _local_5.length;
            var _local_4:* = 0;
            _local_7 = 0;
            while (_local_7 < _local_3)
            {
                _local_9 = getPointsFromRelation(_local_10.getPoints(_local_5[_local_7]));
                _local_2 = Math.abs(PointPolygonUtil.polygonVertexArea(_local_9));
                if (_local_2 > _local_4)
                {
                    _local_4 = _local_2;
                    _local_8 = _local_9;
                };
                _local_7++;
            };
            if (_local_8 == null)
            {
            };
            return (_local_8);
        }

        public static function getPointsFromRelation(_arg_1:Vector.<IRelationPoint>):Vector.<Point>
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_2:Vector.<Point> = new Vector.<Point>();
            for each (var _local_3:IRelationPoint in _arg_1)
            {
                _local_2.push(_local_3.p);
            };
            return (_local_2);
        }*/

        public static function pointStraightLineCoordinate(_arg_1:Point, _arg_2:Point, _arg_3:Point):Point
        {
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_10:Vector.<Number> = getLineF(_arg_2, _arg_3, _pointLineCoordinate);
            var _local_9:* = 1E-5;
            if (Math.abs(_local_10[0]) < _local_9)
            {
                _local_10[0] = 0;
            };
            if (Math.abs(_local_10[1]) < _local_9)
            {
                _local_10[1] = 0;
            };
            if (((_local_10[0] == 0) && (_local_10[1] == 0)))
            {
                return (null);
            };
            if (_local_10[0] == 0)
            {
                _local_6 = _arg_1.x;
                _local_7 = -(_local_10[2] / _local_10[1]);
            }
            else
            {
                if (_local_10[1] == 0)
                {
                    _local_6 = -(_local_10[2] / _local_10[0]);
                    _local_7 = _arg_1.y;
                }
                else
                {
                    _local_8 = (-(_local_10[0]) / _local_10[1]);
                    _local_4 = (-(_local_10[2]) / _local_10[1]);
                    _local_5 = (Math.pow(_local_8, 2) + 1);
                    _local_6 = (((_arg_1.x + (_arg_1.y * _local_8)) - (_local_4 * _local_8)) / _local_5);
                    _local_7 = ((_local_6 * _local_8) + _local_4);
                };
            };
            return (new Point(_local_6, _local_7));
        }

        public static function pointStraightLineDistance(_arg_1:Point, _arg_2:Point, _arg_3:Point):Number
        {
            var _local_4:Vector.<Number> = getLineF(_arg_2, _arg_3, _pointLineDistance);
            return (Math.abs(((((_arg_1.x * _local_4[0]) + (_arg_1.y * _local_4[1])) + _local_4[2]) / Math.sqrt((Math.pow(_local_4[0], 2) + Math.pow(_local_4[1], 2))))));
        }

        public static function pointStraightLineDistanceWithSign(_arg_1:Point, _arg_2:Point, _arg_3:Point):Number
        {
            var _local_4:Vector.<Number> = getLineF(_arg_2, _arg_3, _pointLineDistance2);
            return ((((_arg_1.x * _local_4[0]) + (_arg_1.y * _local_4[1])) + _local_4[2]) / Math.sqrt((Math.pow(_local_4[0], 2) + Math.pow(_local_4[1], 2))));
        }

        public static function pointInLine(_arg_1:Point, _arg_2:Point, _arg_3:Point, _arg_4:Number):Boolean
        {
            var _local_5:Number = pointStraightLineDistance(_arg_1, _arg_2, _arg_3);
            if (((_local_5 < _arg_4) || (_local_5 == 0)))
            {
                return (true);
            };
            return (false);
        }

        public static function pointInSegment(_arg_1:Point, _arg_2:Point, _arg_3:Point, _arg_4:Number=NaN, _arg_5:Boolean=true):Boolean
        {
            if (isNaN(_arg_4))
            {
                _arg_4 = MathErrorConfig.pixelError;
            };
            if (PointUtil.pointEqualError(_arg_1, _arg_2, _arg_4))
            {
                return (_arg_5);
            };
            if (PointUtil.pointEqualError(_arg_1, _arg_3, _arg_4))
            {
                return (_arg_5);
            };
            PointUtil.subtract(_arg_1, _arg_2, _pointInSegmentP1);
            PointUtil.subtract(_arg_1, _arg_3, _pointInSegmentP2);
            if (VectorPointUtil.dot(_pointInSegmentP1, _pointInSegmentP2) > _arg_4)
            {
                return (false);
            };
            return (pointInLine(_arg_1, _arg_2, _arg_3, _arg_4));
        }

        public static function pointSegmentDistance(_arg_1:Point, _arg_2:Point, _arg_3:Point):Number
        {
            var _local_4:Point = pointStraightLineCoordinate(_arg_1, _arg_2, _arg_3);
            if (pointInSegment(_local_4, _arg_2, _arg_3))
            {
                return (pointStraightLineDistance(_arg_1, _arg_2, _arg_3));
            };
            return (Math.min(PointUtil.distance(_arg_1, _arg_2), PointUtil.distance(_arg_1, _arg_3)));
        }

        public static function lineKEqualEroor(_arg_1:Number, _arg_2:Number, _arg_3:Number=0.00174532925199433):Boolean
        {
            var _local_5:Number = Math.atan(_arg_1);
            var _local_6:Number = Math.atan(_arg_2);
            var _local_4:Number = Math.abs((_local_5 - _local_6));
            if (_local_4 < _arg_3)
            {
                return (true);
            };
            _local_4 = Math.abs((_local_4 - 3.14159265358979));
            if (_local_4 < _arg_3)
            {
                return (true);
            };
            return (false);
        }

        public static function lineK(_arg_1:Point, _arg_2:Point):Number
        {
            return ((_arg_1.y - _arg_2.y) / (_arg_1.x - _arg_2.x));
        }

        public static function getNormal(_arg_1:Point, _arg_2:Point):Point
        {
            var _local_3:Point = _arg_2.subtract(_arg_1);
            var _local_4:Number = _local_3.x;
            _local_3.x = -(_local_3.y);
            _local_3.y = _local_4;
            return (_local_3);
        }

        public static function linePointIntersection1(_arg_1:Point, _arg_2:Point, _arg_3:Point, _arg_4:Point):Point
        {
            var _local_5:Point = linePointIntersection(_arg_1, _arg_2, _arg_3, _arg_4);
            if (_local_5 == null)
            {
                return (null);
            };
            if (PointLineUtil.pointInSegment(_local_5, _arg_3, _arg_4))
            {
                return (_local_5);
            };
            return (null);
        }

        public static function segmentSegmentIntersection(_arg_1:Point, _arg_2:Point, _arg_3:Point, _arg_4:Point):Point
        {
            var _local_5:Point = linePointIntersection(_arg_1, _arg_2, _arg_3, _arg_4);
            if (_local_5 == null)
            {
                return (null);
            };
            if (((PointLineUtil.pointInSegment(_local_5, _arg_3, _arg_4)) && (PointLineUtil.pointInSegment(_local_5, _arg_1, _arg_2))))
            {
                return (_local_5);
            };
            return (null);
        }

        public static function linePointIntersection(_arg_1:Point, _arg_2:Point, _arg_3:Point, _arg_4:Point):Point
        {
            getLineF(_arg_1, _arg_2, _linePointIntersection);
            var _local_6:Number = _linePointIntersection[0];
            var _local_9:Number = _linePointIntersection[1];
            var _local_7:Number = _linePointIntersection[2];
            getLineF(_arg_3, _arg_4, _linePointIntersection);
            var _local_10:Number = _linePointIntersection[0];
            var _local_8:Number = _linePointIntersection[1];
            var _local_11:Number = _linePointIntersection[2];
            var _local_5:Point = lineLineIntersection(_local_6, _local_9, _local_7, _local_10, _local_8, _local_11);
            return (_local_5);
        }

        public static function getLineF(_arg_1:Point, _arg_2:Point, _arg_3:Vector.<Number>=null):Vector.<Number>
        {
            var _local_6:Number = (_arg_2.y - _arg_1.y);
            var _local_5:Number = (_arg_1.x - _arg_2.x);
            var _local_4:Number = ((_arg_2.x * _arg_1.y) - (_arg_1.x * _arg_2.y));
            if (!_arg_3)
            {
                return (Vector.<Number>([_local_6, _local_5, _local_4]));
            };
            _arg_3[0] = _local_6;
            _arg_3[1] = _local_5;
            _arg_3[2] = _local_4;
            return (_arg_3);
        }

        public static function segmentRayIntersection(_arg_1:Point, _arg_2:Point, _arg_3:Point, _arg_4:Point):Point
        {
            var _local_6:Point = _arg_4.subtract(_arg_3);
            var _local_5:Point = linePointIntersection(_arg_1, _arg_2, _arg_3, _arg_4);
            if ((((_local_5 == null) || (VectorPointUtil.dot(_local_5.subtract(_arg_3), _local_6) < 0)) || (!(pointInSegment(_local_5, _arg_1, _arg_2)))))
            {
                return (null);
            };
            return (_local_5);
        }

        public static function lineLineIntersection(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number):Point
        {
            var _local_8:Number = ((_arg_1 * _arg_5) - (_arg_4 * _arg_2));
            if (Math.abs(_local_8) < 1E-5)
            {
                return (null);
            };
            var _local_7:Number = (((_arg_2 * _arg_6) - (_arg_5 * _arg_3)) / _local_8);
            var _local_9:Number = (((_arg_1 * _arg_6) - (_arg_4 * _arg_3)) / -(_local_8));
            return (new Point(_local_7, _local_9));
        }


    }
}//package net.house3d.framework.algorithm.data.utils

