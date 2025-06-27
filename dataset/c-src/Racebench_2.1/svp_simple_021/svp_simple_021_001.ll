; ModuleID = 'svp_simple_021_001.bc'
source_filename = "./svp_simple_021_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.svp_simple_021_001_tc_block_data = type { i8, i8, i8 }

@svp_simple_021_001_tc_block_rcvd_bytes_ch1 = common global i16 0, align 2
@svp_simple_021_001_tc_chan1_buff = common global [256 x i8] zeroinitializer, align 16
@svp_simple_021_001_tc_buff_p = common global i8* null, align 8
@svp_simple_021_001_tc_block_rcvd_bytes = common global i16 0, align 2
@svp_simple_021_001_tc_chan2_buff = common global [256 x i8] zeroinitializer, align 16
@svp_simple_021_001_tc_block_rcvd_bytes_ch2 = common global i16 0, align 2

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_init() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  ret void, !dbg !11
}

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_RecvTcBlock() #0 !dbg !12 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = bitcast i32* %1 to i8*, !dbg !13
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3, !dbg !13
  store i32 0, i32* %1, align 4, !dbg !14, !tbaa !15
  %4 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !19, !tbaa !20
  %5 = zext i16 %4 to i32, !dbg !19
  %6 = icmp sge i32 %5, 16, !dbg !22
  br i1 %6, label %7, label %21, !dbg !19

7:                                                ; preds = %0
  store volatile i16 0, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !23, !tbaa !20
  %8 = bitcast i32* %2 to i8*, !dbg !24
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !24
  store i32 0, i32* %2, align 4, !dbg !25, !tbaa !15
  br label %9, !dbg !26

9:                                                ; preds = %16, %7
  %10 = load i32, i32* %2, align 4, !dbg !27, !tbaa !15
  %11 = icmp slt i32 %10, 256, !dbg !28
  br i1 %11, label %12, label %19, !dbg !29

12:                                               ; preds = %9
  %13 = load i32, i32* %2, align 4, !dbg !30, !tbaa !15
  %14 = sext i32 %13 to i64, !dbg !31
  %15 = getelementptr inbounds [256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i64 0, i64 %14, !dbg !31
  store volatile i8 0, i8* %15, align 1, !dbg !32, !tbaa !33
  br label %16, !dbg !34

16:                                               ; preds = %12
  %17 = load i32, i32* %2, align 4, !dbg !35, !tbaa !15
  %18 = add nsw i32 %17, 1, !dbg !35
  store i32 %18, i32* %2, align 4, !dbg !35, !tbaa !15
  br label %9, !dbg !29, !llvm.loop !36

19:                                               ; preds = %9
  store i32 255, i32* %1, align 4, !dbg !37, !tbaa !15
  %20 = bitcast i32* %2 to i8*, !dbg !38
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #3, !dbg !38
  br label %21, !dbg !38

21:                                               ; preds = %19, %0
  %22 = bitcast i32* %1 to i8*, !dbg !39
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #3, !dbg !39
  ret void, !dbg !39
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_main() #0 !dbg !40 {
  %1 = alloca %struct.svp_simple_021_001_tc_block_data, align 1
  %2 = alloca i32, align 4
  %3 = bitcast %struct.svp_simple_021_001_tc_block_data* %1 to i8*, !dbg !41
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %3) #3, !dbg !41
  call void @svp_simple_021_001_init(), !dbg !42
  call void @svp_simple_021_001_RecvTcBlock(), !dbg !43
  %4 = bitcast i32* %2 to i8*, !dbg !44
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !44
  store i32 0, i32* %2, align 4, !dbg !45, !tbaa !15
  br label %5, !dbg !46

5:                                                ; preds = %28, %0
  %6 = load i32, i32* %2, align 4, !dbg !47, !tbaa !15
  %7 = icmp slt i32 %6, 2, !dbg !48
  br i1 %7, label %8, label %31, !dbg !49

8:                                                ; preds = %5
  %9 = load i32, i32* %2, align 4, !dbg !50, !tbaa !15
  %10 = icmp eq i32 %9, 0, !dbg !51
  br i1 %10, label %11, label %13, !dbg !50

11:                                               ; preds = %8
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i32 0, i32 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !52, !tbaa !53
  %12 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !55, !tbaa !20
  store volatile i16 %12, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !56, !tbaa !20
  br label %15, !dbg !57

13:                                               ; preds = %8
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan2_buff, i32 0, i32 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !58, !tbaa !53
  %14 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !59, !tbaa !20
  store volatile i16 %14, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !60, !tbaa !20
  br label %15

15:                                               ; preds = %13, %11
  %16 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !61, !tbaa !53
  %17 = getelementptr inbounds i8, i8* %16, i64 2, !dbg !62
  %18 = load volatile i8, i8* %17, align 1, !dbg !63, !tbaa !33
  %19 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 0, !dbg !64
  store i8 %18, i8* %19, align 1, !dbg !65, !tbaa !66
  %20 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !68, !tbaa !53
  %21 = getelementptr inbounds i8, i8* %20, i64 4, !dbg !69
  %22 = load volatile i8, i8* %21, align 1, !dbg !70, !tbaa !33
  %23 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 1, !dbg !71
  store i8 %22, i8* %23, align 1, !dbg !72, !tbaa !73
  %24 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !74, !tbaa !53
  %25 = getelementptr inbounds i8, i8* %24, i64 5, !dbg !75
  %26 = load volatile i8, i8* %25, align 1, !dbg !76, !tbaa !33
  %27 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 2, !dbg !77
  store i8 %26, i8* %27, align 1, !dbg !78, !tbaa !79
  br label %28, !dbg !80

28:                                               ; preds = %15
  %29 = load i32, i32* %2, align 4, !dbg !81, !tbaa !15
  %30 = add nsw i32 %29, 1, !dbg !81
  store i32 %30, i32* %2, align 4, !dbg !81, !tbaa !15
  br label %5, !dbg !49, !llvm.loop !82

31:                                               ; preds = %5
  %32 = bitcast i32* %2 to i8*, !dbg !83
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #3, !dbg !83
  %33 = bitcast %struct.svp_simple_021_001_tc_block_data* %1 to i8*, !dbg !83
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %33) #3, !dbg !83
  ret void, !dbg !83
}

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_isr_1() #0 !dbg !84 {
  %1 = load volatile i32, i32* inttoptr (i64 268435456 to i32*), align 4, !dbg !85, !tbaa !15
  %2 = lshr i32 %1, 3, !dbg !86
  %3 = and i32 %2, 8191, !dbg !87
  %4 = trunc i32 %3 to i16, !dbg !88
  store volatile i16 %4, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !89, !tbaa !20
  ret void, !dbg !90
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_021_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_021")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_021_001_init", scope: !8, file: !8, line: 18, type: !9, scopeLine: 18, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_021_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_021")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 22, column: 3, scope: !7)
!11 = !DILocation(line: 23, column: 1, scope: !7)
!12 = distinct !DISubprogram(name: "svp_simple_021_001_RecvTcBlock", scope: !8, file: !8, line: 25, type: !9, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 26, column: 3, scope: !12)
!14 = !DILocation(line: 27, column: 33, scope: !12)
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C/C++ TBAA"}
!19 = !DILocation(line: 29, column: 7, scope: !12)
!20 = !{!21, !21, i64 0}
!21 = !{!"short", !17, i64 0}
!22 = !DILocation(line: 29, column: 50, scope: !12)
!23 = !DILocation(line: 30, column: 48, scope: !12)
!24 = !DILocation(line: 31, column: 5, scope: !12)
!25 = !DILocation(line: 32, column: 12, scope: !12)
!26 = !DILocation(line: 32, column: 10, scope: !12)
!27 = !DILocation(line: 32, column: 17, scope: !12)
!28 = !DILocation(line: 32, column: 19, scope: !12)
!29 = !DILocation(line: 32, column: 5, scope: !12)
!30 = !DILocation(line: 33, column: 40, scope: !12)
!31 = !DILocation(line: 33, column: 7, scope: !12)
!32 = !DILocation(line: 33, column: 43, scope: !12)
!33 = !{!17, !17, i64 0}
!34 = !DILocation(line: 34, column: 5, scope: !12)
!35 = !DILocation(line: 32, column: 27, scope: !12)
!36 = distinct !{!36, !29, !34}
!37 = !DILocation(line: 35, column: 35, scope: !12)
!38 = !DILocation(line: 36, column: 3, scope: !12)
!39 = !DILocation(line: 37, column: 1, scope: !12)
!40 = distinct !DISubprogram(name: "svp_simple_021_001_main", scope: !8, file: !8, line: 39, type: !9, scopeLine: 39, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 40, column: 3, scope: !40)
!42 = !DILocation(line: 42, column: 3, scope: !40)
!43 = !DILocation(line: 44, column: 3, scope: !40)
!44 = !DILocation(line: 45, column: 3, scope: !40)
!45 = !DILocation(line: 46, column: 14, scope: !40)
!46 = !DILocation(line: 46, column: 8, scope: !40)
!47 = !DILocation(line: 46, column: 19, scope: !40)
!48 = !DILocation(line: 46, column: 25, scope: !40)
!49 = !DILocation(line: 46, column: 3, scope: !40)
!50 = !DILocation(line: 47, column: 9, scope: !40)
!51 = !DILocation(line: 47, column: 15, scope: !40)
!52 = !DILocation(line: 48, column: 36, scope: !40)
!53 = !{!54, !54, i64 0}
!54 = !{!"any pointer", !17, i64 0}
!55 = !DILocation(line: 50, column: 11, scope: !40)
!56 = !DILocation(line: 49, column: 46, scope: !40)
!57 = !DILocation(line: 51, column: 5, scope: !40)
!58 = !DILocation(line: 52, column: 36, scope: !40)
!59 = !DILocation(line: 54, column: 11, scope: !40)
!60 = !DILocation(line: 53, column: 46, scope: !40)
!61 = !DILocation(line: 57, column: 23, scope: !40)
!62 = !DILocation(line: 57, column: 52, scope: !40)
!63 = !DILocation(line: 57, column: 21, scope: !40)
!64 = !DILocation(line: 57, column: 14, scope: !40)
!65 = !DILocation(line: 57, column: 19, scope: !40)
!66 = !{!67, !17, i64 0}
!67 = !{!"svp_simple_021_001_tc_block_data", !17, i64 0, !17, i64 1, !17, i64 2}
!68 = !DILocation(line: 58, column: 21, scope: !40)
!69 = !DILocation(line: 58, column: 50, scope: !40)
!70 = !DILocation(line: 58, column: 19, scope: !40)
!71 = !DILocation(line: 58, column: 14, scope: !40)
!72 = !DILocation(line: 58, column: 17, scope: !40)
!73 = !{!67, !17, i64 1}
!74 = !DILocation(line: 59, column: 28, scope: !40)
!75 = !DILocation(line: 59, column: 57, scope: !40)
!76 = !DILocation(line: 59, column: 26, scope: !40)
!77 = !DILocation(line: 59, column: 14, scope: !40)
!78 = !DILocation(line: 59, column: 24, scope: !40)
!79 = !{!67, !17, i64 2}
!80 = !DILocation(line: 60, column: 3, scope: !40)
!81 = !DILocation(line: 46, column: 35, scope: !40)
!82 = distinct !{!82, !49, !80}
!83 = !DILocation(line: 61, column: 1, scope: !40)
!84 = distinct !DISubprogram(name: "svp_simple_021_001_isr_1", scope: !8, file: !8, line: 63, type: !9, scopeLine: 63, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 65, column: 8, scope: !84)
!86 = !DILocation(line: 65, column: 34, scope: !84)
!87 = !DILocation(line: 65, column: 40, scope: !84)
!88 = !DILocation(line: 65, column: 7, scope: !84)
!89 = !DILocation(line: 64, column: 46, scope: !84)
!90 = !DILocation(line: 66, column: 1, scope: !84)
