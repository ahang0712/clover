; ModuleID = 'svp_simple_002_001.bc'
source_filename = "./svp_simple_002_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_002_001_global_array = common global [100000 x i32] zeroinitializer, align 16
@casee2_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_002_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  call void (...) @idlerun(), !dbg !11
  ret void, !dbg !12
}

declare void @init(...) #1

declare void @idlerun(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_002_001_isr_1() #0 !dbg !13 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = bitcast i32* %1 to i8*, !dbg !14
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !14
  %5 = bitcast i32* %2 to i8*, !dbg !14
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #3, !dbg !14
  %6 = bitcast i32* %3 to i8*, !dbg !15
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #3, !dbg !15
  store i32 0, i32* %3, align 4, !dbg !16, !tbaa !17
  br label %7, !dbg !15

7:                                                ; preds = %21, %0
  %8 = load i32, i32* %3, align 4, !dbg !21, !tbaa !17
  %9 = icmp slt i32 %8, 100000, !dbg !22
  br i1 %9, label %12, label %10, !dbg !23

10:                                               ; preds = %7
  %11 = bitcast i32* %3 to i8*, !dbg !23
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %11) #3, !dbg !23
  br label %24

12:                                               ; preds = %7
  %13 = load i32, i32* %3, align 4, !dbg !24, !tbaa !17
  %14 = icmp eq i32 %13, 9999, !dbg !25
  br i1 %14, label %15, label %16, !dbg !24

15:                                               ; preds = %12
  store volatile i32 1, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !26, !tbaa !17
  br label %16, !dbg !27

16:                                               ; preds = %15, %12
  %17 = load i32, i32* %3, align 4, !dbg !28, !tbaa !17
  %18 = icmp eq i32 %17, 100001, !dbg !29
  br i1 %18, label %19, label %20, !dbg !28

19:                                               ; preds = %16
  store volatile i32 1, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !30, !tbaa !17
  br label %20, !dbg !31

20:                                               ; preds = %19, %16
  br label %21, !dbg !32

21:                                               ; preds = %20
  %22 = load i32, i32* %3, align 4, !dbg !33, !tbaa !17
  %23 = add nsw i32 %22, 1, !dbg !33
  store i32 %23, i32* %3, align 4, !dbg !33, !tbaa !17
  br label %7, !dbg !23, !llvm.loop !34

24:                                               ; preds = %10
  %25 = load volatile i32, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !35, !tbaa !17
  %26 = sub nsw i32 %25, 10, !dbg !36
  store i32 %26, i32* %1, align 4, !dbg !37, !tbaa !17
  %27 = load volatile i32, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 0), align 16, !dbg !38, !tbaa !17
  %28 = add nsw i32 %27, 10, !dbg !39
  store i32 %28, i32* %2, align 4, !dbg !40, !tbaa !17
  %29 = bitcast i32* %2 to i8*, !dbg !41
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #3, !dbg !41
  %30 = bitcast i32* %1 to i8*, !dbg !41
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %30) #3, !dbg !41
  ret void, !dbg !41
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_002_001_isr_2() #0 !dbg !42 {
  call void (...) @idlerun(), !dbg !43
  store volatile i32 999, i32* getelementptr inbounds ([100000 x i32], [100000 x i32]* @svp_simple_002_001_global_array, i64 0, i64 9999), align 4, !dbg !44, !tbaa !17
  ret void, !dbg !45
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_002_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_002")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_002_001_main", scope: !8, file: !8, line: 10, type: !9, scopeLine: 10, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_002_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_002")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 11, column: 3, scope: !7)
!11 = !DILocation(line: 12, column: 3, scope: !7)
!12 = !DILocation(line: 13, column: 1, scope: !7)
!13 = distinct !DISubprogram(name: "svp_simple_002_001_isr_1", scope: !8, file: !8, line: 15, type: !9, scopeLine: 15, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!14 = !DILocation(line: 16, column: 3, scope: !13)
!15 = !DILocation(line: 17, column: 8, scope: !13)
!16 = !DILocation(line: 17, column: 12, scope: !13)
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C/C++ TBAA"}
!21 = !DILocation(line: 17, column: 19, scope: !13)
!22 = !DILocation(line: 17, column: 21, scope: !13)
!23 = !DILocation(line: 17, column: 3, scope: !13)
!24 = !DILocation(line: 18, column: 9, scope: !13)
!25 = !DILocation(line: 18, column: 11, scope: !13)
!26 = !DILocation(line: 18, column: 64, scope: !13)
!27 = !DILocation(line: 18, column: 23, scope: !13)
!28 = !DILocation(line: 19, column: 9, scope: !13)
!29 = !DILocation(line: 19, column: 11, scope: !13)
!30 = !DILocation(line: 20, column: 48, scope: !13)
!31 = !DILocation(line: 20, column: 7, scope: !13)
!32 = !DILocation(line: 21, column: 3, scope: !13)
!33 = !DILocation(line: 17, column: 36, scope: !13)
!34 = distinct !{!34, !23, !32}
!35 = !DILocation(line: 22, column: 13, scope: !13)
!36 = !DILocation(line: 22, column: 54, scope: !13)
!37 = !DILocation(line: 22, column: 11, scope: !13)
!38 = !DILocation(line: 24, column: 12, scope: !13)
!39 = !DILocation(line: 24, column: 47, scope: !13)
!40 = !DILocation(line: 24, column: 10, scope: !13)
!41 = !DILocation(line: 25, column: 1, scope: !13)
!42 = distinct !DISubprogram(name: "svp_simple_002_001_isr_2", scope: !8, file: !8, line: 27, type: !9, scopeLine: 27, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 28, column: 3, scope: !42)
!44 = !DILocation(line: 29, column: 44, scope: !42)
!45 = !DILocation(line: 31, column: 1, scope: !42)
