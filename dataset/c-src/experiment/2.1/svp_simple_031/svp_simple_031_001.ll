; ModuleID = 'svp_simple_031_001.bc'
source_filename = "./svp_simple_031_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.svp_simple_031_001_tc_block_data = type { i8, i8, i8 }

@svp_simple_031_001_tc_chan1_buff = common global [256 x i8] zeroinitializer, align 16
@svp_simple_031_001_tc_buff_p = common global i8* null, align 8
@svp_simple_031_001_tc_block_rcvd_bytes_ch1 = common global i16 0, align 2
@svp_simple_031_001_tc_block_rcvd_bytes = common global i16 0, align 2
@svp_simple_031_001_tc_block_rcvd_bytes_ch2 = common global i16 0, align 2
@svp_simple_031_001_gloable_var1 = common global i32 0, align 4
@svp_simple_031_001_tc_chan2_buff = common global [256 x i8] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @svp_simple_031_001_main() #0 !dbg !7 {
  %1 = alloca %struct.svp_simple_031_001_tc_block_data, align 1
  %2 = alloca i32, align 4
  call void @svp_simple_031_001_init(), !dbg !10
  %3 = bitcast %struct.svp_simple_031_001_tc_block_data* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %3) #3, !dbg !11
  %4 = bitcast i32* %2 to i8*, !dbg !12
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !12
  store i32 0, i32* %2, align 4, !dbg !13, !tbaa !14
  %5 = load i32, i32* %2, align 4, !dbg !18, !tbaa !14
  %6 = icmp eq i32 %5, 0, !dbg !19
  br i1 %6, label %7, label %9, !dbg !18

7:                                                ; preds = %0
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_031_001_tc_chan1_buff, i32 0, i32 0), i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !20, !tbaa !21
  %8 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !23, !tbaa !24
  store volatile i16 %8, i16* @svp_simple_031_001_tc_block_rcvd_bytes, align 2, !dbg !26, !tbaa !24
  br label %9, !dbg !27

9:                                                ; preds = %7, %0
  %10 = load i8*, i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !28, !tbaa !21
  %11 = getelementptr inbounds i8, i8* %10, i64 2, !dbg !29
  %12 = load volatile i8, i8* %11, align 1, !dbg !30, !tbaa !31
  %13 = getelementptr inbounds %struct.svp_simple_031_001_tc_block_data, %struct.svp_simple_031_001_tc_block_data* %1, i32 0, i32 0, !dbg !32
  store i8 %12, i8* %13, align 1, !dbg !33, !tbaa !34
  %14 = load i8*, i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !36, !tbaa !21
  %15 = getelementptr inbounds i8, i8* %14, i64 4, !dbg !37
  %16 = load volatile i8, i8* %15, align 1, !dbg !38, !tbaa !31
  %17 = getelementptr inbounds %struct.svp_simple_031_001_tc_block_data, %struct.svp_simple_031_001_tc_block_data* %1, i32 0, i32 1, !dbg !39
  store i8 %16, i8* %17, align 1, !dbg !40, !tbaa !41
  %18 = load i8*, i8** @svp_simple_031_001_tc_buff_p, align 8, !dbg !42, !tbaa !21
  %19 = getelementptr inbounds i8, i8* %18, i64 5, !dbg !43
  %20 = load volatile i8, i8* %19, align 1, !dbg !44, !tbaa !31
  %21 = getelementptr inbounds %struct.svp_simple_031_001_tc_block_data, %struct.svp_simple_031_001_tc_block_data* %1, i32 0, i32 2, !dbg !45
  store i8 %20, i8* %21, align 1, !dbg !46, !tbaa !47
  call void @svp_simple_031_001_func_3(), !dbg !48
  %22 = bitcast i32* %2 to i8*, !dbg !49
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #3, !dbg !49
  %23 = bitcast %struct.svp_simple_031_001_tc_block_data* %1 to i8*, !dbg !49
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %23) #3, !dbg !49
  ret void, !dbg !49
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_031_001_func_1(i32 %0, i32 %1) #0 !dbg !50 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4, !tbaa !14
  store i32 %1, i32* %4, align 4, !tbaa !14
  %6 = bitcast i32* %5 to i8*, !dbg !51
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #3, !dbg !51
  %7 = load i32, i32* %3, align 4, !dbg !52, !tbaa !14
  %8 = load i32, i32* %4, align 4, !dbg !53, !tbaa !14
  %9 = icmp slt i32 %7, %8, !dbg !54
  br i1 %9, label %10, label %14, !dbg !52

10:                                               ; preds = %2
  %11 = load i32, i32* %3, align 4, !dbg !55, !tbaa !14
  %12 = load i32, i32* %4, align 4, !dbg !56, !tbaa !14
  %13 = mul nsw i32 %11, %12, !dbg !57
  store i32 %13, i32* %5, align 4, !dbg !58, !tbaa !14
  br label %16, !dbg !59

14:                                               ; preds = %2
  %15 = call i32 @svp_simple_031_001_func_2(i32 10), !dbg !60
  store i32 %15, i32* %5, align 4, !dbg !61, !tbaa !14
  br label %16

16:                                               ; preds = %14, %10
  %17 = load i32, i32* %5, align 4, !dbg !62, !tbaa !14
  %18 = bitcast i32* %5 to i8*, !dbg !63
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #3, !dbg !63
  ret i32 %17, !dbg !64
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_031_001_func_2(i32 %0) #0 !dbg !65 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4, !tbaa !14
  %4 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !66, !tbaa !24
  %5 = zext i16 %4 to i32, !dbg !66
  %6 = icmp sgt i32 %5, 0, !dbg !67
  br i1 %6, label %7, label %9, !dbg !66

7:                                                ; preds = %1
  %8 = load i32, i32* %3, align 4, !dbg !68, !tbaa !14
  store i32 %8, i32* %2, align 4, !dbg !69
  br label %10, !dbg !69

9:                                                ; preds = %1
  store i32 0, i32* %2, align 4, !dbg !70
  br label %10, !dbg !70

10:                                               ; preds = %9, %7
  %11 = load i32, i32* %2, align 4, !dbg !71
  ret i32 %11, !dbg !71
}

; Function Attrs: nounwind uwtable
define void @svp_simple_031_001_init() #0 !dbg !72 {
  %1 = call i32 (...) @rand(), !dbg !73
  %2 = trunc i32 %1 to i16, !dbg !73
  store volatile i16 %2, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !74, !tbaa !24
  %3 = call i32 (...) @rand(), !dbg !75
  %4 = trunc i32 %3 to i16, !dbg !75
  store volatile i16 %4, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !76, !tbaa !24
  call void (...) @init(), !dbg !77
  ret void, !dbg !78
}

declare i32 @rand(...) #2

declare void @init(...) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_031_001_func_3() #0 !dbg !79 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !80
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !80
  store i32 0, i32* %1, align 4, !dbg !81, !tbaa !14
  %3 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !82, !tbaa !24
  %4 = zext i16 %3 to i32, !dbg !82
  %5 = icmp sge i32 %4, 16, !dbg !83
  br i1 %5, label %6, label %11, !dbg !82

6:                                                ; preds = %0
  %7 = load volatile i32, i32* @svp_simple_031_001_gloable_var1, align 4, !dbg !84, !tbaa !14
  %8 = load volatile i16, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !85, !tbaa !24
  %9 = zext i16 %8 to i32, !dbg !85
  %10 = call i32 @svp_simple_031_001_func_1(i32 %7, i32 %9), !dbg !86
  br label %11, !dbg !87

11:                                               ; preds = %6, %0
  %12 = bitcast i32* %1 to i8*, !dbg !88
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #3, !dbg !88
  ret void, !dbg !88
}

; Function Attrs: nounwind uwtable
define void @svp_simple_031_001_isr_1() #0 !dbg !89 {
  %1 = load volatile i32, i32* inttoptr (i64 268435456 to i32*), align 4, !dbg !90, !tbaa !14
  %2 = lshr i32 %1, 3, !dbg !91
  %3 = and i32 %2, 8191, !dbg !92
  %4 = trunc i32 %3 to i16, !dbg !93
  store volatile i16 %4, i16* @svp_simple_031_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !94, !tbaa !24
  ret void, !dbg !95
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_031_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_031")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_031_001_main", scope: !8, file: !8, line: 38, type: !9, scopeLine: 38, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_031_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_031")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 39, column: 3, scope: !7)
!11 = !DILocation(line: 40, column: 3, scope: !7)
!12 = !DILocation(line: 42, column: 3, scope: !7)
!13 = !DILocation(line: 42, column: 7, scope: !7)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 43, column: 7, scope: !7)
!19 = !DILocation(line: 43, column: 13, scope: !7)
!20 = !DILocation(line: 44, column: 34, scope: !7)
!21 = !{!22, !22, i64 0}
!22 = !{!"any pointer", !16, i64 0}
!23 = !DILocation(line: 46, column: 9, scope: !7)
!24 = !{!25, !25, i64 0}
!25 = !{!"short", !16, i64 0}
!26 = !DILocation(line: 45, column: 44, scope: !7)
!27 = !DILocation(line: 47, column: 3, scope: !7)
!28 = !DILocation(line: 49, column: 21, scope: !7)
!29 = !DILocation(line: 49, column: 50, scope: !7)
!30 = !DILocation(line: 49, column: 19, scope: !7)
!31 = !{!16, !16, i64 0}
!32 = !DILocation(line: 49, column: 12, scope: !7)
!33 = !DILocation(line: 49, column: 17, scope: !7)
!34 = !{!35, !16, i64 0}
!35 = !{!"svp_simple_031_001_tc_block_data", !16, i64 0, !16, i64 1, !16, i64 2}
!36 = !DILocation(line: 50, column: 19, scope: !7)
!37 = !DILocation(line: 50, column: 48, scope: !7)
!38 = !DILocation(line: 50, column: 17, scope: !7)
!39 = !DILocation(line: 50, column: 12, scope: !7)
!40 = !DILocation(line: 50, column: 15, scope: !7)
!41 = !{!35, !16, i64 1}
!42 = !DILocation(line: 51, column: 26, scope: !7)
!43 = !DILocation(line: 51, column: 55, scope: !7)
!44 = !DILocation(line: 51, column: 24, scope: !7)
!45 = !DILocation(line: 51, column: 12, scope: !7)
!46 = !DILocation(line: 51, column: 22, scope: !7)
!47 = !{!35, !16, i64 2}
!48 = !DILocation(line: 52, column: 3, scope: !7)
!49 = !DILocation(line: 53, column: 1, scope: !7)
!50 = distinct !DISubprogram(name: "svp_simple_031_001_func_1", scope: !8, file: !8, line: 55, type: !9, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 56, column: 3, scope: !50)
!52 = !DILocation(line: 57, column: 7, scope: !50)
!53 = !DILocation(line: 57, column: 11, scope: !50)
!54 = !DILocation(line: 57, column: 9, scope: !50)
!55 = !DILocation(line: 58, column: 9, scope: !50)
!56 = !DILocation(line: 58, column: 13, scope: !50)
!57 = !DILocation(line: 58, column: 11, scope: !50)
!58 = !DILocation(line: 58, column: 7, scope: !50)
!59 = !DILocation(line: 59, column: 3, scope: !50)
!60 = !DILocation(line: 60, column: 9, scope: !50)
!61 = !DILocation(line: 60, column: 7, scope: !50)
!62 = !DILocation(line: 62, column: 10, scope: !50)
!63 = !DILocation(line: 63, column: 1, scope: !50)
!64 = !DILocation(line: 62, column: 3, scope: !50)
!65 = distinct !DISubprogram(name: "svp_simple_031_001_func_2", scope: !8, file: !8, line: 64, type: !9, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 65, column: 7, scope: !65)
!67 = !DILocation(line: 65, column: 50, scope: !65)
!68 = !DILocation(line: 66, column: 12, scope: !65)
!69 = !DILocation(line: 66, column: 5, scope: !65)
!70 = !DILocation(line: 68, column: 5, scope: !65)
!71 = !DILocation(line: 70, column: 1, scope: !65)
!72 = distinct !DISubprogram(name: "svp_simple_031_001_init", scope: !8, file: !8, line: 72, type: !9, scopeLine: 72, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 73, column: 48, scope: !72)
!74 = !DILocation(line: 73, column: 46, scope: !72)
!75 = !DILocation(line: 74, column: 48, scope: !72)
!76 = !DILocation(line: 74, column: 46, scope: !72)
!77 = !DILocation(line: 76, column: 3, scope: !72)
!78 = !DILocation(line: 77, column: 1, scope: !72)
!79 = distinct !DISubprogram(name: "svp_simple_031_001_func_3", scope: !8, file: !8, line: 79, type: !9, scopeLine: 79, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 80, column: 3, scope: !79)
!81 = !DILocation(line: 81, column: 33, scope: !79)
!82 = !DILocation(line: 83, column: 7, scope: !79)
!83 = !DILocation(line: 83, column: 50, scope: !79)
!84 = !DILocation(line: 84, column: 31, scope: !79)
!85 = !DILocation(line: 85, column: 27, scope: !79)
!86 = !DILocation(line: 84, column: 5, scope: !79)
!87 = !DILocation(line: 86, column: 3, scope: !79)
!88 = !DILocation(line: 87, column: 1, scope: !79)
!89 = distinct !DISubprogram(name: "svp_simple_031_001_isr_1", scope: !8, file: !8, line: 89, type: !9, scopeLine: 89, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 91, column: 8, scope: !89)
!91 = !DILocation(line: 91, column: 34, scope: !89)
!92 = !DILocation(line: 91, column: 40, scope: !89)
!93 = !DILocation(line: 91, column: 7, scope: !89)
!94 = !DILocation(line: 90, column: 46, scope: !89)
!95 = !DILocation(line: 92, column: 1, scope: !89)
