; ModuleID = 'svp_simple_005_001.bc'
source_filename = "./svp_simple_005_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_005_001_global_condition = global i32 0, align 4
@svp_simple_005_001_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_005_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32
  %3 = alloca i32, align 4
  call void (...) @init(), !dbg !10
  %4 = bitcast i32* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !11
  store i32 0, i32* %1, align 4, !dbg !12, !tbaa !13
  br label %5, !dbg !11

5:                                                ; preds = %29, %0
  %6 = load i32, i32* %1, align 4, !dbg !17, !tbaa !13
  %7 = icmp slt i32 %6, 10000, !dbg !18
  br i1 %7, label %10, label %8, !dbg !19

8:                                                ; preds = %5
  store i32 2, i32* %2, align 4
  %9 = bitcast i32* %1 to i8*, !dbg !19
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #3, !dbg !19
  br label %32

10:                                               ; preds = %5
  %11 = bitcast i32* %3 to i8*, !dbg !20
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #3, !dbg !20
  store i32 0, i32* %3, align 4, !dbg !21, !tbaa !13
  br label %12, !dbg !20

12:                                               ; preds = %25, %10
  %13 = load i32, i32* %3, align 4, !dbg !22, !tbaa !13
  %14 = icmp slt i32 %13, 10000, !dbg !23
  br i1 %14, label %17, label %15, !dbg !24

15:                                               ; preds = %12
  store i32 5, i32* %2, align 4
  %16 = bitcast i32* %3 to i8*, !dbg !24
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #3, !dbg !24
  br label %28

17:                                               ; preds = %12
  %18 = load i32, i32* %1, align 4, !dbg !25, !tbaa !13
  %19 = icmp eq i32 %18, 9999, !dbg !26
  br i1 %19, label %20, label %24, !dbg !27

20:                                               ; preds = %17
  %21 = load i32, i32* %3, align 4, !dbg !28, !tbaa !13
  %22 = icmp eq i32 %21, 1000, !dbg !29
  br i1 %22, label %23, label %24, !dbg !30

23:                                               ; preds = %20
  store volatile i32 1, i32* @svp_simple_005_001_global_var, align 4, !dbg !31, !tbaa !13
  br label %24, !dbg !32

24:                                               ; preds = %23, %20, %17
  br label %25, !dbg !33

25:                                               ; preds = %24
  %26 = load i32, i32* %3, align 4, !dbg !34, !tbaa !13
  %27 = add nsw i32 %26, 1, !dbg !34
  store i32 %27, i32* %3, align 4, !dbg !34, !tbaa !13
  br label %12, !dbg !24, !llvm.loop !35

28:                                               ; preds = %15
  br label %29, !dbg !36

29:                                               ; preds = %28
  %30 = load i32, i32* %1, align 4, !dbg !37, !tbaa !13
  %31 = add nsw i32 %30, 1, !dbg !37
  store i32 %31, i32* %1, align 4, !dbg !37, !tbaa !13
  br label %5, !dbg !19, !llvm.loop !38

32:                                               ; preds = %8
  %33 = load volatile i32, i32* @svp_simple_005_001_global_condition, align 4, !dbg !39, !tbaa !13
  %34 = icmp eq i32 %33, 1, !dbg !40
  br i1 %34, label %35, label %36, !dbg !39

35:                                               ; preds = %32
  store volatile i32 9, i32* @svp_simple_005_001_global_var, align 4, !dbg !41, !tbaa !13
  br label %36, !dbg !42

36:                                               ; preds = %35, %32
  store volatile i32 5, i32* @svp_simple_005_001_global_var, align 4, !dbg !43, !tbaa !13
  ret void, !dbg !44
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_005_001_isr_1() #0 !dbg !45 {
  %1 = alloca i32, align 4
  call void (...) @idlerun(), !dbg !46
  %2 = bitcast i32* %1 to i8*, !dbg !47
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !47
  %3 = load volatile i32, i32* @svp_simple_005_001_global_var, align 4, !dbg !48, !tbaa !13
  store i32 %3, i32* %1, align 4, !dbg !49, !tbaa !13
  %4 = bitcast i32* %1 to i8*, !dbg !50
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %4) #3, !dbg !50
  ret void, !dbg !50
}

declare void @idlerun(...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_005_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_005")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_005_001_main", scope: !8, file: !8, line: 12, type: !9, scopeLine: 12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_005_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_005")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 13, column: 3, scope: !7)
!11 = !DILocation(line: 14, column: 8, scope: !7)
!12 = !DILocation(line: 14, column: 12, scope: !7)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 14, column: 19, scope: !7)
!18 = !DILocation(line: 14, column: 21, scope: !7)
!19 = !DILocation(line: 14, column: 3, scope: !7)
!20 = !DILocation(line: 15, column: 10, scope: !7)
!21 = !DILocation(line: 15, column: 14, scope: !7)
!22 = !DILocation(line: 15, column: 21, scope: !7)
!23 = !DILocation(line: 15, column: 23, scope: !7)
!24 = !DILocation(line: 15, column: 5, scope: !7)
!25 = !DILocation(line: 16, column: 12, scope: !7)
!26 = !DILocation(line: 16, column: 14, scope: !7)
!27 = !DILocation(line: 16, column: 26, scope: !7)
!28 = !DILocation(line: 16, column: 30, scope: !7)
!29 = !DILocation(line: 16, column: 32, scope: !7)
!30 = !DILocation(line: 16, column: 11, scope: !7)
!31 = !DILocation(line: 17, column: 39, scope: !7)
!32 = !DILocation(line: 17, column: 9, scope: !7)
!33 = !DILocation(line: 18, column: 5, scope: !7)
!34 = !DILocation(line: 15, column: 38, scope: !7)
!35 = distinct !{!35, !24, !33}
!36 = !DILocation(line: 19, column: 3, scope: !7)
!37 = !DILocation(line: 14, column: 36, scope: !7)
!38 = distinct !{!38, !19, !36}
!39 = !DILocation(line: 21, column: 7, scope: !7)
!40 = !DILocation(line: 21, column: 43, scope: !7)
!41 = !DILocation(line: 23, column: 35, scope: !7)
!42 = !DILocation(line: 24, column: 3, scope: !7)
!43 = !DILocation(line: 25, column: 33, scope: !7)
!44 = !DILocation(line: 26, column: 1, scope: !7)
!45 = distinct !DISubprogram(name: "svp_simple_005_001_isr_1", scope: !8, file: !8, line: 28, type: !9, scopeLine: 28, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 29, column: 3, scope: !45)
!47 = !DILocation(line: 30, column: 3, scope: !45)
!48 = !DILocation(line: 31, column: 12, scope: !45)
!49 = !DILocation(line: 31, column: 10, scope: !45)
!50 = !DILocation(line: 32, column: 1, scope: !45)
